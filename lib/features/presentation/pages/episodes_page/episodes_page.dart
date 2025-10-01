import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_app/core/utils/formatters.dart';
import 'package:podcast_app/features/presentation/pages/episodes_page/widgets/episode_list_shimmer.dart';
import 'package:podcast_app/features/presentation/pages/main_page/screens/home/widget/custom_tile.dart';
import 'package:podcast_app/features/presentation/providers/episode_for_podcast/episode_provider.dart';
import 'package:podcast_app/features/presentation/providers/saved_episodes/saved_episode_provider.dart';

import '../../../data/model/custom_error/custom_error.dart';
import '../../../data/model/podcast/podcast_data.dart';
import 'widgets/episode_custom_description.dart';
import 'widgets/episode_custom_title.dart';

class EpisodesPage extends ConsumerWidget {
  static const routeName = '/episodes';
  const EpisodesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final podcast = ModalRoute.of(context)?.settings.arguments as PodcastData;

    final episodeListState = ref.watch(episodeProvider(podcastId: podcast.id));
    final savedEpisodesAsync = ref.watch(savedEpisodeProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ).copyWith(top: 10.h, bottom: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                  ),
                  iconSize: 20.sp,
                  icon: const Icon(Icons.keyboard_backspace_rounded)),
              10.verticalSpace,
              EpisodeCustomTitle(
                imageUrl: podcast.image,
                title: podcast.title,
                subtitle: podcast.publisher,
                onPressed: () {},
              ),
              10.verticalSpace,
              EpisodeCustomDescription(
                desc: podcast.description,
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 15.w,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey[700],
                      thickness: 0.2.h,
                    ),
                  ),
                  Text(
                    'Episodes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[700],
                      thickness: 0.2.h,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              Expanded(
                child: episodeListState.when(
                  data: (episodes) {
                    return savedEpisodesAsync.when(
                      data: (savedEpisodes) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: episodes.length,
                          separatorBuilder: (context, index) =>
                              10.verticalSpace,
                          itemBuilder: (context, index) {
                            final episode = episodes[index];
                            final isSaved = savedEpisodes.contains(episode);
                            return CustomTile(
                              title: episode.title,
                              subtitle: formatAudioLength(episode.audioLength),
                              imageUrl: podcast.image,
                              onPressed: () {},
                              isSaved: isSaved,
                              onSaveIconPressed: () => ref
                                    .read(savedEpisodeProvider.notifier)
                                    .toggleSavedEpisode(episode: episode),
                            );
                          },
                        );
                      },
                      loading: () => const EpisodeListShimmer(),
                      error: (error, stackTrace) =>
                          Center(child: Text('Error loading saved episodes')),
                    );
                  },
                  loading: () => const EpisodeListShimmer(),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
