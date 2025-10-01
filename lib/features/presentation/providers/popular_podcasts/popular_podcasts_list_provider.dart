import 'package:podcast_app/features/data/model/podcast/podcast_data.dart';
import 'package:podcast_app/features/logic/usecases/get_popular_podcasts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repo_impl/repo_impl.dart';

part 'popular_podcasts_list_provider.g.dart';

final repo = RepoImpl();

@riverpod
class PopularPodcastsList extends _$PopularPodcastsList {
  
  @override
  FutureOr<List<PodcastData>> build() {
    return _fetchPopularPodcast();
  }

  Future<List<PodcastData>> _fetchPopularPodcast()async{
    final popularPodcasts = GetPopularPodcasts(repo: repo);
    return await popularPodcasts.call();
  }
}