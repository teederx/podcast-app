import '../../data/model/episode/episode_data.dart';
import '../repo/repo.dart';

class SearchedEpisodeList {
  final Repo repo;
  const SearchedEpisodeList({required this.repo});

  Future<List<EpisodeData>> call({required String query}) {
    return repo.searchPodcasts(query: query);
  }
}