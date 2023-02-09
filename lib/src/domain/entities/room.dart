class Room {
  Room({
    required this.name,
    required this.temperature,
    required this.airHumidity,
    required this.roomLights,
    required this.airCondition,
    required this.musicInfo,
  });

  final String name;
  final double temperature;
  final double airHumidity;
  final RoomLights roomLights;
  final AirCondition airCondition;
  final MusicInfo musicInfo;
}

class AirCondition {
  AirCondition({required this.isOn, required this.temperature});

  final bool isOn;
  final int temperature;
}

class RoomLights {
  RoomLights({required this.isOn, required this.intensity});

  final bool isOn;
  final int intensity;
}

class MusicInfo {
  MusicInfo({required this.isOn, required this.currentSong});

  final bool isOn;
  final Song currentSong;
}

class Song {}
