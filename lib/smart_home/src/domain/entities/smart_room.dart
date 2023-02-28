import 'package:flutter_samples/smart_home/src/domain/entities/music_info.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_device.dart';

class SmartRoom {
  SmartRoom({
    required this.name,
    required this.imageUrl,
    required this.temperature,
    required this.airHumidity,
    required this.roomLights,
    required this.airCondition,
    required this.musicInfo,
  });

  final String name;
  final String imageUrl;
  final double temperature;
  final double airHumidity;
  final SmartDevice roomLights;
  final SmartDevice airCondition;
  final MusicInfo musicInfo;

  SmartRoom copyWith({
    String? name,
    String? imageUrl,
    double? temperature,
    double? airHumidity,
    SmartDevice? roomLights,
    SmartDevice? airCondition,
    MusicInfo? musicInfo,
  }) =>
      SmartRoom(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        temperature: temperature ?? this.temperature,
        airHumidity: airHumidity ?? this.airHumidity,
        roomLights: roomLights ?? this.roomLights,
        airCondition: airCondition ?? this.airCondition,
        musicInfo: musicInfo ?? this.musicInfo,
      );

  static List<SmartRoom> fakeValues = [
    _room,
    _room.copyWith(name: 'DININGROOM', imageUrl: _imagesUrls[2]),
    _room.copyWith(name: 'KITCHEN', imageUrl: _imagesUrls[3]),
    _room.copyWith(name: 'BEDROOM', imageUrl: _imagesUrls[4]),
    _room.copyWith(name: 'BATHROOM', imageUrl: _imagesUrls[1]),
  ];
}

final _room = SmartRoom(
  name: 'LIVINGROOM',
  imageUrl: _imagesUrls[0],
  temperature: 12,
  airHumidity: 23,
  roomLights: SmartDevice(isOn: true, value: 20),
  airCondition: SmartDevice(isOn: false, value: 10),
  musicInfo: MusicInfo(isOn: false, currentSong: Song()),
);

const _imagesUrls = [
  'https://images.unsplash.com/photo-1600121848594-d8644e57abab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
  'https://images.unsplash.com/photo-1564540583246-934409427776?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1706&q=80',
  'https://images.unsplash.com/photo-1616486886892-ff366aa67ba4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
  'https://images.unsplash.com/photo-1588854337221-4cf9fa96059c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
  'https://m.media-amazon.com/images/I/715hLONUQOL._AC_SL1500_.jpg'
];
