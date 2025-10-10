import 'dart:async';
import 'package:podcast_app/features/data/model/episode/episode_data.dart';
import 'package:podcast_app/features/data/repo_impl/repo_impl.dart';
import 'package:podcast_app/features/logic/usecases/searched_episode_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../logic/repo/repo.dart';

part 'api_search_episode_provider.g.dart';

final Repo _repo = RepoImpl();

@riverpod
class ApiSearchEpisode extends _$ApiSearchEpisode {
  String _lastQuery = "";
  // ignore: avoid_public_notifier_properties
  String get lastQuery => _lastQuery;

  Timer? _debounce;

  @override
  FutureOr<List<EpisodeData>> build() async {
    // Clean up when provider is disposed
    ref.onDispose(() {
      _debounce?.cancel();
    });

    return [];
  }

  Future<void> fetchEpisodeList({required String query}) async {
    _lastQuery = query;

    // Cancel any existing debounce timer
    _debounce?.cancel();

    if (query.isEmpty) {
      state = const AsyncData([]);
      return;
    }

    // Start a new debounce timer (500ms)
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      state = const AsyncLoading();
      state = await AsyncValue.guard(() async {
        final searchEpisode = SearchedEpisodeList(repo: _repo);
        return await searchEpisode.call(query: query);
      });
    });
  }
}
