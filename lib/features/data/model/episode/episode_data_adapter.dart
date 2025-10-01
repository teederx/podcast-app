import 'package:hive/hive.dart';
import 'episode_data.dart';

class EpisodeDataAdapter extends TypeAdapter<EpisodeData> {
  @override
  final int typeId = 0;

  @override
  EpisodeData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return EpisodeData(
      id: fields[0] as String? ?? '',
      title: fields[1] as String? ?? '',
      description: fields[2] as String? ?? '',
      audio: fields[3] as String? ?? '',
      image: fields[4] as String? ?? '',
      audioLength: fields[5] as int? ?? 0,
    );
  }

  @override
  void write(BinaryWriter writer, EpisodeData obj) {
    writer
      ..writeByte(6) // number of fields
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.audio)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.audioLength);
  }
}
