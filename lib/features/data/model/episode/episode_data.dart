import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'episode_data.freezed.dart';
part 'episode_data.g.dart';

@freezed
@HiveType(typeId: 0) // 👈 annotate the freezed class
abstract class EpisodeData with _$EpisodeData {
  const factory EpisodeData({
    @HiveField(0) @Default('') String id,
    @HiveField(1) @Default('') String title,
    @HiveField(2) @Default('') String description,
    @HiveField(3) @Default('') String audio,
    @HiveField(4) @JsonKey(name: 'thumbnail') @Default('') String image,
    @HiveField(5) @JsonKey(name: 'audio_length_sec') @Default(0) int audioLength,
  }) = _EpisodeData;

  factory EpisodeData.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDataFromJson(json);
}
