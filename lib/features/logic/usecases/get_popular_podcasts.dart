import 'package:podcast_app/features/data/model/podcast/podcast_data.dart';

import '../repo/repo.dart';

class GetPopularPodcasts {
  final Repo repo;
  const GetPopularPodcasts({required this.repo});

  Future<List<PodcastData>> call(){
    return repo.popularPodcasts();
  }
}