import 'package:podcast_app/features/data/model/podcast/podcast_data.dart';

import '../../data/model/episode/episode_data.dart';

abstract class Repo {
  Future<List<PodcastData>> popularPodcasts();
  Future<List<EpisodeData>> searchPodcasts({required String query});
  Future<List<EpisodeData>> episodesForPodcast({required String podcastId});
  Future<EpisodeData> getEpisode({required String episodeId});
}
