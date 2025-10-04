// in lib/.../saved.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_app/features/presentation/pages/main_page/screens/home/widget/tab_bar.dart';
import 'package:podcast_app/features/presentation/providers/saved_episodes/saved_episode_provider.dart';
import 'package:podcast_app/features/presentation/providers/local_search_query/saved_search_query_provider.dart';

import '../../../../../data/model/custom_error/custom_error.dart';
import '../../../../../data/model/episode/episode_data.dart';
import '../home/widget/bookmarked/widgets/bookmarked_list.dart';
import '../home/widget/bookmarked/widgets/episode_shimmer.dart';

// Create a simple provider to hold the search query state
// final savedSearchQueryProvider = StateProvider<String>((ref) => '');

class Saved extends ConsumerWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedEpisodeState = ref.watch(savedEpisodeProvider);
    final searchQuery = ref.watch(savedSearchQueryProvider);

    return Column(
      children: [
        Tabbar(
          title: "Saved Podcasts",
          subtitle: "Find saved podcast here",
          hintText: "Search saved podcasts...",
          onChanged: (String query) {
            ref.read(savedSearchQueryProvider.notifier).updateQuery(query);
          },
        ),
        20.verticalSpace,
        Expanded(
          child: savedEpisodeState.when(
            data: (List<EpisodeData> episodes) {
              // Perform the filtering directly here
              final filteredEpisodes = episodes.where((e) {
                final query = searchQuery.toLowerCase();
                if (query.isEmpty) {
                  return true; // Show all if query is empty
                }
                return e.title.toLowerCase().contains(query) ||
                       e.description.toLowerCase().contains(query);
              }).toList();

              // Handle the "no results" case
              if (filteredEpisodes.isEmpty && searchQuery.isNotEmpty) {
                return const Center(child: Text("No saved podcasts found."));
              }
              
              // Handle the "no saved items at all" case
              if (episodes.isEmpty) {
                return const Center(child: Text("You haven't saved any podcasts yet."));
              }

              return BookmarkedList(
                episodes: filteredEpisodes,
                count: filteredEpisodes.length,
              );
            },
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