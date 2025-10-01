import 'package:podcast_app/features/data/model/episode/episode_data.dart';

abstract class LocalStorage {
  Future<void> toggleSaveEpisode ({required EpisodeData episode});
  Future<List<EpisodeData>> getSavedEpisodes();
}