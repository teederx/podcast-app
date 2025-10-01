import 'package:podcast_app/features/data/model/episode/episode_data.dart';

import '../../repo/local_storage.dart';

class GetSavedEpisodes {
  final LocalStorage localStorage;
  const GetSavedEpisodes({required this.localStorage});

  Future<List<EpisodeData>> call() {
    return localStorage.getSavedEpisodes();
  }
}