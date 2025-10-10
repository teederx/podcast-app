import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../core/utils/formatters.dart';
import '../../../../../../../../data/model/episode/episode_data.dart';
import '../../../../../../../providers/saved_episodes/saved_episode_provider.dart';
import '../../../../../../play_episodes_page/play_episodes_page.dart';
import '../../custom_tile.dart';

class BookmarkedList extends ConsumerWidget {
  const BookmarkedList({
    super.key,
    this.count = 10,
    required this.episodes,
  });
  final int count;
  final List<EpisodeData> episodes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (episodes.isEmpty) {
      return Center(
        child: Text(
          "No saved episodes",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey[500],
          ),
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => 10.verticalSpace,
      itemBuilder: (context, index) {
        final episode = episodes[index];
        return CustomTile(
          title: episode.title,
          subtitle: formatAudioLength(episode.audioLength),
          imageUrl: episode.image,
          onPressed: () => Navigator.pushNamed(
              context, PlayEpisodesPage.routeName,
              arguments: episode),
          onSaveIconPressed: () => ref
              .read(savedEpisodeProvider.notifier)
              .toggleSavedEpisode(episode: episode),
          isSaved: true,
        );
      },
      itemCount: episodes.length.clamp(0, count),
      shrinkWrap: true,
    );
  }
}
