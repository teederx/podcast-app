import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/handle_exception.dart';
import '../../logic/repo/local_storage.dart';
import '../model/episode/episode_data.dart';

class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl();

  Future<Box> get _taskBox async {
    if (!Hive.isBoxOpen('podcast')) {
      await Hive.openBox('podcast');
    }
    return Hive.box('podcast');
  }

  @override
  Future<void> toggleSaveEpisode({required EpisodeData episode}) async {
    try {
      final box = await _taskBox;
      List<EpisodeData> savedEpisodes =
          box.get('savedEpisodes', defaultValue: []).cast<EpisodeData>();
      if (savedEpisodes.contains(episode)) {
        savedEpisodes.remove(episode);
      } else {
        savedEpisodes.add(episode);
      }
      await box.put('savedEpisodes', savedEpisodes);
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future<List<EpisodeData>> getSavedEpisodes() async {
    try {
      final box = await _taskBox;
      return box.get('savedEpisodes', defaultValue: []).cast<EpisodeData>();
    } catch (e) {
      throw handleException(e);
    }
  }
}
