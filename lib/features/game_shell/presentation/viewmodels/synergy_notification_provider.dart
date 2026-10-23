import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Holds the currently active synergy notification.
/// Tuple: (synergyId, bonusDescription)
/// Null when no notification is showing.
final synergyNotificationProvider =
    StateProvider<(String, int)?>((ref) => null);
