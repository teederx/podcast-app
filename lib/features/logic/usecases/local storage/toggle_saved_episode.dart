import '../../../data/model/episode/episode_data.dart';
import '../../repo/local_storage.dart';

class ToggleSavedEpisode {
  final LocalStorage localStorage;

  ToggleSavedEpisode({required this.localStorage});

  Future<void> call({required EpisodeData episode}) async {
    await localStorage.toggleSaveEpisode(episode: episode);
  }
}