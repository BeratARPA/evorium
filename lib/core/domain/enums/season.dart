enum Season {
  spring,
  summer,
  autumn,
  winter,
  drought,
  abundance,
  disaster;

  String get displayName => switch (this) {
        spring => 'Spring',
        summer => 'Summer',
        autumn => 'Autumn',
        winter => 'Winter',
        drought => 'Drought',
        abundance => 'Abundance',
        disaster => 'Disaster',
      };

  bool get isHarsh => this == drought || this == winter || this == disaster;
  bool get isBountiful => this == spring || this == abundance;
}
