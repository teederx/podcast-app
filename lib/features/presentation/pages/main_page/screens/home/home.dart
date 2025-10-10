import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_app/features/presentation/pages/show_episodes_page/widgets/episode_list_shimmer.dart';

import '../../../../providers/api_search_episode/api_search_episode_provider.dart';
import 'widget/default_content.dart';
import 'widget/search_results.dart';
import 'widget/tab_bar.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(apiSearchEpisodeProvider);

    return Column(
      children: [
        // 🔎 Search Tabbar
        Tabbar(
          onChanged: (String query) {
            ref
                .read(apiSearchEpisodeProvider.notifier)
                .fetchEpisodeList(query: query);
          },
        ),
        20.verticalSpace,

        // 🔥 Content area
        Expanded(
          child: searchState.when(
            // ✅ Show results
            data: (episodes) {
              if (episodes.isNotEmpty) {
                return SearchResults(episodes: episodes);
              }

              final query =
                  ref.watch(apiSearchEpisodeProvider.notifier).lastQuery;
              if (query.isEmpty) {
                return const DefaultContent();
              } else {
                return Center(
                  child: Text(
                    "No results found",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
                  ),
                );
              }
            },

            loading: () => const Center(
              child: EpisodeListShimmer(),
            ),

            error: (err, stack) => Center(
              child: Text(
                err.toString(),
                style: TextStyle(color: Colors.red, fontSize: 14.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
