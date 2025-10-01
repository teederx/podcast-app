import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcast_data.freezed.dart';
part 'podcast_data.g.dart';

@freezed
abstract class PodcastData with _$PodcastData {
  const factory PodcastData({
    @Default('') String id,
    @Default('') String title,
    @Default('') String image,
    @Default('') String description,
    @Default('') String publisher,
  }) = _PodcastData;

  factory PodcastData.fromJson(Map<String, dynamic> json) =>
      _$PodcastDataFromJson(json);
}
