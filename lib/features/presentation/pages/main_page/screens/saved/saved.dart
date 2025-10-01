import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_app/features/presentation/pages/main_page/screens/home/widget/tab_bar.dart';
import 'package:podcast_app/features/presentation/providers/saved_episodes/saved_episode_provider.dart';

import '../../../../../data/model/custom_error/custom_error.dart';
import '../../../../../data/model/episode/episode_data.dart';
import '../home/widget/bookmarked/widgets/bookmarked_list.dart';
import '../home/widget/bookmarked/widgets/episode_shimmer.dart';

class Saved extends ConsumerWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedEpisodeState = ref.watch(savedEpisodeProvider);
    return Column(
      children: [
        Tabbar(
          title: "Saved Podcasts",
          subtitle: "Find saved podcast here",
          hintText: "Search saved podcasts...",
          onSubmittedComplete: (String query) {
            // TODO: Perform action to search through all the podcasts
          },
        ),
        20.verticalSpace,
        Expanded(
          child: savedEpisodeState.when(
            data: (List<EpisodeData> episodes) => BookmarkedList(
              episodes: episodes,
              count: episodes.length,
            ),
            error: (error, stackTrace) {
              final e = error as CustomError;
              return Column(
                children: [
                  Text(e.code),
                  Text(e.message),
                ],
              );
            },
            loading: () => EpisodeShimmer(count: 10),
          ),
        ),
      ],
    );
  }
}
