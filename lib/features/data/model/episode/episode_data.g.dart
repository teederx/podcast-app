// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpisodeData _$EpisodeDataFromJson(Map<String, dynamic> json) => _EpisodeData(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      audio: json['audio'] as String? ?? '',
      image: json['thumbnail'] as String? ?? '',
      audioLength: (json['audio_length_sec'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$EpisodeDataToJson(_EpisodeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'audio': instance.audio,
      'thumbnail': instance.image,
      'audio_length_sec': instance.audioLength,
    };
