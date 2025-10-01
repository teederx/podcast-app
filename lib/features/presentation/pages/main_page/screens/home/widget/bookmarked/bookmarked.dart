import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podcast_app/features/presentation/pages/main_page/screens/home/widget/bookmarked/widgets/episode_shimmer.dart';
import 'package:podcast_app/features/presentation/providers/saved_episodes/saved_episode_provider.dart';

import '../../../../../../../data/model/custom_error/custom_error.dart';
import '../../../../../../../data/model/episode/episode_data.dart';
import '../tile_titles.dart';
import 'widgets/bookmarked_list.dart';

class Bookmarked extends ConsumerWidget {
  const Bookmarked({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkedListState = ref.watch(savedEpisodeProvider);

    return bookmarkedListState.when(
      data: (List<EpisodeData> episodes) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TileTitles(
            title: 'Saved Episodes',
            onPressed: () {
              final tabController = DefaultTabController.of(context);
              tabController.animateTo(1);
            },
          ),
          BookmarkedList(
            count: 2,
            episodes: episodes,
          ),
        ],
      ),
      error: (error, stackTrace) {
        final e = error as CustomError;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(e.code),
            Text(e.message),
          ],
        );
      },
      loading: () => EpisodeShimmer(),
    );
  }
}
