import 'package:are_engine_core/are_engine_core.dart';

import '../utils/game_logger.dart';
import 'game_events.dart';

/// Central registry that declares and registers all ARE engine rules.
/// Rules are grouped so they can be enabled/disabled by game context.
class GameRuleRegistry {
  GameRuleRegistry({required AreEngine engine}) : _engine = engine;

  final AreEngine _engine;

  void registerAllRules() {
    _registerActions();
    _registerCreatureRules();
    _registerBiomeRules();
    _registerSeasonRules();
    _registerResourceRules();
    _registerNightRules();
    _registerResourceCollectionRules();
    GameLogger.i('GameRuleRegistry: all rules registered');
  }

  // ── Actions ──────────────────────────────────────────────────────────────
  void _registerActions() {
    // Logging action — fires on every significant event for debug
    _engine.registerInlineAction('log_event', (ctx, s) async {
      GameLogger.d('ARE event fired: ${s.get<String?>('event_name') ?? '?'}');
    });

    // Placeholder — real game actions fire Riverpod updates via callbacks.
    // These callbacks are injected after bootstrap via [injectCallbacks].
    _engine.registerInlineAction('apply_biome_heat_damage', (ctx, s) async {
      final damage = s.get<int?>('damage') ?? 5;
      onBiomeDamage?.call(damage, 'heat');
    });

    _engine.registerInlineAction('apply_biome_cold_damage', (ctx, s) async {
      final damage = s.get<int?>('damage') ?? 3;
      onBiomeDamage?.call(damage, 'cold');
    });

    _engine.registerInlineAction('show_low_hp_warning', (ctx, s) async {
      onLowHpWarning?.call();
    });

    _engine.registerInlineAction('reduce_food_resources', (ctx, s) async {
      final multiplier = s.get<double?>('multiplier') ?? 0.5;
      onFoodMultiplierChanged?.call(multiplier);
    });

    _engine.registerInlineAction('activate_synergy', (ctx, s) async {
      final synergyId = s.get<String?>('synergy_id') ?? '';
      final bonus = s.get<int?>('bonus') ?? 0;
      onSynergyActivated?.call(synergyId, bonus);
    });

    _engine.registerInlineAction('show_starvation_warning', (ctx, s) async {
      onStarvationWarning?.call();
    });
  }

  // ── Creature Rules ────────────────────────────────────────────────────────
  void _registerCreatureRules() {
    // Low HP warning when creature HP drops below 20%
    _engine.addRule(
      Rule.create('low_hp_warning')
          .on(GameEvents.creatureDamaged)
          .whenLessThan('hp_percent', 0.20)
          .then('show_low_hp_warning'),
    );

    // Trait synergy: Compound Eye + Carnivorous Digestion = Precision Hunter
    _engine.addRule(
      Rule.create('synergy_precise_hunter')
          .on(GameEvents.mutationApplied)
          .whenEquals('has_compound_eye', true)
          .whenEquals('has_carnivorous_digestion', true)
          .then('activate_synergy',
              (s) => s
                ..set('synergy_id', 'precise_hunter')
                ..set('bonus', 15)),
    );
  }

  // ── Biome Rules ───────────────────────────────────────────────────────────
  void _registerBiomeRules() {
    // Biome heat damage: if temp > 60 AND creature ADP < 15, deal 5 heat dmg
    _engine.addRule(
      Rule.create('biome_heat_damage')
          .on(GameEvents.clockTick)
          .whenGreaterThan('biome_temp', 60.0)
          .whenLessThan('creature_adp', 15)
          .then('apply_biome_heat_damage',
              (s) => s
                ..set('damage', 5)
                ..set('damage_type', 'heat')),
    );

    // Biome cold damage: if temp < -5 AND creature ADP < 10
    _engine.addRule(
      Rule.create('biome_cold_damage')
          .on(GameEvents.clockTick)
          .whenLessThan('biome_temp', -5.0)
          .whenLessThan('creature_adp', 10)
          .then('apply_biome_cold_damage',
              (s) => s
                ..set('damage', 3)
                ..set('damage_type', 'cold')),
    );
  }

  // ── Season Rules ──────────────────────────────────────────────────────────
  void _registerSeasonRules() {
    // Drought: food resources cut in half
    _engine.addRule(
      Rule.create('drought_food_reduction')
          .on(GameEvents.biomeConditionChanged)
          .whenEquals('season', 'drought')
          .then('reduce_food_resources',
              (s) => s..set('multiplier', 0.5)),
    );

    // Abundance: food doubled but fires as a biome condition change
    _engine.addRule(
      Rule.create('abundance_food_bonus')
          .on(GameEvents.biomeConditionChanged)
          .whenEquals('season', 'abundance')
          .then('reduce_food_resources',
              (s) => s..set('multiplier', 2.0)),
    );
  }

  // ── Resource Rules ────────────────────────────────────────────────────────
  void _registerResourceRules() {
    // Starvation warning: fire when food reaches 0
    _engine.addRule(
      Rule.create('starvation_warning')
          .on(GameEvents.clockTick)
          .whenEquals('food', 0)
          .then('show_starvation_warning'),
    );
  }

  // ── Resource Collection Rules ─────────────────────────────────────────────
  void _registerResourceCollectionRules() {
    _engine.registerInlineAction('log_resource_collected', (ctx, s) async {
      final type = s.get<String?>('resource_type') ?? '?';
      final amount = s.get<int?>('amount') ?? 0;
      GameLogger.d('Resource collected: $type x$amount');
    });

    _engine.registerInlineAction('log_resource_depleted', (ctx, s) async {
      final type = s.get<String?>('resource_type') ?? '?';
      GameLogger.d('Resource depleted: $type');
    });

    _engine.addRule(
      Rule.create('on_resource_collected')
          .on(GameEvents.resourceCollected)
          .then('log_resource_collected'),
    );

    _engine.addRule(
      Rule.create('on_resource_depleted')
          .on(GameEvents.resourceDepleted)
          .then('log_resource_depleted'),
    );
  }

  // ── Night Rules ───────────────────────────────────────────────────────────
  void _registerNightRules() {
    // Night started — activate night rule group
    _engine.addRule(
      Rule.create('activate_night_rules')
          .on(GameEvents.biomeNightStarted)
          .then('log_event', (s) => s..set('event_name', 'night_started')),
    );
  }

  // ── Callbacks (injected post-bootstrap) ──────────────────────────────────
  /// Called when the ARE engine triggers biome-based creature damage.
  void Function(int damage, String damageType)? onBiomeDamage;

  /// Called when creature HP drops below warning threshold.
  void Function()? onLowHpWarning;

  /// Called when a seasonal food multiplier changes.
  void Function(double multiplier)? onFoodMultiplierChanged;

  /// Called when a trait synergy is activated.
  void Function(String synergyId, int bonus)? onSynergyActivated;

  /// Called when food reaches 0 (starvation begins).
  void Function()? onStarvationWarning;

  /// Inject runtime callbacks so ARE actions can update Riverpod state.
  void injectCallbacks({
    required void Function(int, String) onBiomeDamage,
    required void Function() onLowHpWarning,
    required void Function(double) onFoodMultiplierChanged,
    required void Function(String, int) onSynergyActivated,
    void Function()? onStarvationWarning,
  }) {
    this.onBiomeDamage = onBiomeDamage;
    this.onLowHpWarning = onLowHpWarning;
    this.onFoodMultiplierChanged = onFoodMultiplierChanged;
    this.onSynergyActivated = onSynergyActivated;
    this.onStarvationWarning = onStarvationWarning;
  }
}
