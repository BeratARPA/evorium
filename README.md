# Evorium

**A roguelite evolution and strategy game prototype, built with Flutter.**

You pick a biome, guide a creature through encounters, collect mutations and evolve it across generations. Each run ends with a generation summary, and progress carries over through the evolution tree and achievements.

> **Status: unfinished, no longer in development.** The core systems are in place (roadmap phases 0–4). Content, balancing and release work (phases 5–6) were never done. The repository is kept as a reference.

## What is in it

- **Biomes, creatures, mutations, traits and encounters**, all data-driven from JSON (`assets/data/`).
- **Evolution tree** and **generation summary** between runs.
- **Achievements** and a **tutorial** flow.
- **Game rules on an engine:** events and rules run on [ARE](https://github.com/BeratARPA/ARE) (`are_engine_core`), my Action-Rule-Event engine (`lib/core/rules`).
- **RNG and time abstractions** in `lib/core`, kept apart from the game logic.
- **Local saves** with Hive.

Design documents: [`assets/Evorium_GDD_v1.docx`](assets/Evorium_GDD_v1.docx) (game design) and [`assets/Evorium_Technical_Roadmap_v1.docx`](assets/Evorium_Technical_Roadmap_v1.docx) (technical roadmap).

## Tech stack

| Area | Choice |
|---|---|
| Architecture | Feature-first: `data / domain / presentation` per feature |
| State | Riverpod |
| Navigation | go_router |
| DI | get_it |
| Models | freezed + json_serializable |
| Rules | are_engine_core |
| Storage | Hive, shared_preferences |
| Effects | flutter_animate, lottie, audioplayers, vibration |

## Running it

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## License

[MIT](LICENSE)
