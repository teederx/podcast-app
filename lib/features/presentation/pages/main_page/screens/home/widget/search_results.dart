import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/formatters.dart';
import '../../../../../providers/saved_episodes/saved_episode_provider.dart';
import '../../../../play_episodes_page/play_episodes_page.dart';
import 'custom_tile.dart';

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
          onPressed: () => Navigator.pushNamed(
              context, PlayEpisodesPage.routeName,
              arguments: episode),
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
