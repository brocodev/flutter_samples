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
    _room.copyWith(name: 'DINNER ROOM', imageUrl: _imagesUrls[2]),
    _room.copyWith(name: 'KITCHEN', imageUrl: _imagesUrls[3]),
    _room.copyWith(name: 'BEDROOM', imageUrl: _imagesUrls[4]),
    _room.copyWith(name: 'BATHROOM', imageUrl: _imagesUrls[1]),
  ];
}

final _room = SmartRoom(
  name: 'LIVING ROOM',
  imageUrl: _imagesUrls[0],
  temperature: 12,
  airHumidity: 23,
  roomLights: SmartDevice(isOn: true, value: 20),
  airCondition: SmartDevice(isOn: false, value: 10),
  musicInfo: MusicInfo(isOn: false, currentSong: Song()),
);

const _imagesUrls = [
  'https://cdn1.coppel.com/images/catalog/pm/4467263-1.jpg',
  'https://images.ctfassets.net/g44e4oo0e2sa/5tvDeKAKSGZdXDajkgMmWs/1d8952769220498c8a6f653df19ca291/Rhea_Suite_Main_Image_1500px.jpg?fm=webp&q=75&r=4',
  'https://mueblesvizcaya.com.mx/wp-content/uploads/2021/01/30KENES00-COMEDOR-KENA-P6.jpg',
  'https://cdn.shopify.com/s/files/1/2217/4155/products/bali-3-amb_1400x.png?v=1661114773',
  'https://m.media-amazon.com/images/I/715hLONUQOL._AC_SL1500_.jpg'
];
