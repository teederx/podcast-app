import 'package:podcast_app/features/data/model/episode/episode_data.dart';
import 'package:podcast_app/features/data/repo_impl/repo_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../logic/usecases/episodes_for_podcast.dart';

part 'episode_provider.g.dart';

final repo = RepoImpl();

@riverpod
class Episode extends _$Episode {
  @override
  FutureOr<List<EpisodeData>> build({required String podcastId}) {
    return _fetchEpisodes(podcastId: podcastId);
  }

  Future<List<EpisodeData>> _fetchEpisodes ({required String podcastId}) async {
    final episodeList = EpisodesForPodcast(repo: repo);
    return await episodeList.call(podcastId: podcastId);
  }
}