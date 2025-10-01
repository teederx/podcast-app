import 'package:podcast_app/core/handle_exception.dart';
import 'package:podcast_app/features/data/model/episode/episode_data.dart';
import 'package:podcast_app/features/data/model/podcast/podcast_data.dart';

import '../../logic/repo/repo.dart';
import '../src/dio.dart';

class RepoImpl implements Repo {
  final _dio = dio;

  @override
  Future<List<PodcastData>> popularPodcasts() async {
    try {
      final response = await _dio.get('/best_podcasts');
      final podcastList = (response.data['podcasts'] as List)
          .map((podcast) => PodcastData.fromJson(podcast))
          .toList();
      return podcastList;
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future<PodcastData> searchPodcasts({required String query}) {
    // TODO: implement searchPodcasts
    throw UnimplementedError();
  }

  @override
  Future<List<EpisodeData>> episodesForPodcast(
      {required String podcastId}) async {
    try {
      final response = await _dio.get('/podcasts/$podcastId');

      final episodeList = (response.data['episodes'] as List)
          .map((episode) => EpisodeData.fromJson(episode))
          .toList();
      return episodeList;
    } catch (e) {
      throw handleException(e);
    }
  }
  
  @override
  Future<EpisodeData> getEpisode({required String episodeId}) async {
    try{
      final response = await _dio.get('/episodes/$episodeId');
      final episode = EpisodeData.fromJson(response.data);
      return episode;
    } catch (e) {
      throw handleException(e);
    }
  }
}
