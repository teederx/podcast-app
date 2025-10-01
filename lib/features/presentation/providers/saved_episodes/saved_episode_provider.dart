import 'package:podcast_app/features/data/repo_impl/local_storage_impl.dart';
import 'package:podcast_app/features/logic/usecases/local%20storage/get_saved_episodes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/episode/episode_data.dart';

part 'saved_episode_provider.g.dart';

final localStorage = LocalStorageImpl();

@riverpod
class SavedEpisode extends _$SavedEpisode {
  @override
  FutureOr<List<EpisodeData>> build() {
    return _getSavedData();
  }

  Future<List<EpisodeData>> _getSavedData() async {
    final getSavedList = GetSavedEpisodes(localStorage: localStorage);
    return await getSavedList.call();
  }

  Future<void> toggleSavedEpisode({required EpisodeData episode}) async {
    state = AsyncLoading();

    state = await AsyncValue.guard(() async {
      final currentList = state.value ?? [];
      final isSaved = currentList.any((e) => e.id == episode.id);

      List<EpisodeData> updatedList;
      if (isSaved) {
        updatedList =
            currentList.where((e) => e.id != episode.id).toList();
      } else {
        updatedList = [...currentList, episode];
      }

      await localStorage.toggleSaveEpisode(episode: episode);
      return updatedList;
    }); 
  }
}