// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PodcastData _$PodcastDataFromJson(Map<String, dynamic> json) => _PodcastData(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      description: json['description'] as String? ?? '',
      publisher: json['publisher'] as String? ?? '',
    );

Map<String, dynamic> _$PodcastDataToJson(_PodcastData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'publisher': instance.publisher,
    };
