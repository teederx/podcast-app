import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_app/features/presentation/pages/episodes_page/widgets/episode_list_shimmer.dart';
import 'package:podcast_app/features/presentation/pages/main_page/screens/home/widget/popular/popular.dart';
import 'package:podcast_app/features/presentation/providers/saved_episodes/saved_episode_provider.dart';

import '../../../../../../core/utils/formatters.dart';
import '../../../../providers/api_search_episode/api_search_episode_provider.dart';
import 'widget/bookmarked/bookmarked.dart';
import 'widget/custom_tile.dart';
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

class DefaultContent extends StatelessWidget {
  const DefaultContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 150.h,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        10.verticalSpace,
        const Bookmarked(),
        10.verticalSpace,
        Divider(
          color: Colors.grey[700],
          thickness: 0.2.h,
        ),
        5.verticalSpace,
        const Popular(),
      ],
    );
  }
}

class SearchResults extends ConsumerWidget {
  const SearchResults({super.key, required this.episodes});

  final List episodes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      itemCount: episodes.length,
      separatorBuilder: (_, __) => 12.verticalSpace,
      itemBuilder: (context, index) {
        final episode = episodes[index];
        return CustomTile(
          title: episode.title,
          subtitle: formatAudioLength(episode.audioLength),
          imageUrl: episode.image,
          onPressed: () {
            // TODO: Navigate to details
          },
          onPlayIconPressed: () {
            // TODO: Play episode
          },
          onSaveIconPressed: () {
            ref
                .read(savedEpisodeProvider.notifier)
                .toggleSavedEpisode(episode: episode);
          },
          isSaved: ref.watch(savedEpisodeProvider).maybeWhen(
                data: (savedEpisodes) =>
                    savedEpisodes.any((e) => e.id == episode.id),
                orElse: () => false,
              ),
        );
      },
    );
  }
}
