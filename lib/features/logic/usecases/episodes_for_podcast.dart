import '../../data/model/episode/episode_data.dart';
import '../repo/repo.dart';

class EpisodesForPodcast {
  final Repo repo;

  EpisodesForPodcast({required this.repo});

  Future<List<EpisodeData>> call({required String podcastId}) {
    return repo.episodesForPodcast(podcastId: podcastId);
  }
}