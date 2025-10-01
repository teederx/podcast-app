import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:podcast_app/features/data/model/custom_error/custom_error.dart';
import 'package:podcast_app/features/data/model/podcast/podcast_data.dart';
import 'package:podcast_app/features/presentation/pages/main_page/screens/all_podcasts/all_podcasts.dart';
import 'package:podcast_app/features/presentation/pages/main_page/screens/home/widget/tile_titles.dart';
import 'package:podcast_app/features/presentation/providers/popular_podcasts/popular_podcasts_list_provider.dart';

import 'widget/popular_grid.dart';
import 'widget/popular_shimmer.dart';

class Popular extends ConsumerWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularListState = ref.watch(popularPodcastsListProvider);

    return popularListState.when(
      data: (List<PodcastData> podcasts) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TileTitles(
            title: 'Popular Podcasts',
            onPressed: () {
              showCupertinoModalBottomSheet(
                context: context,
                expand: false,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24.r),
                      ),
                    ),
                    child: SafeArea(
                      top: false,
                      child: DraggableScrollableSheet(
                        expand: false,
                        initialChildSize: 0.6,
                        minChildSize: 0.4,
                        maxChildSize: 0.95,
                        builder: (context, scrollController) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            child: AllPodcasts(
                              scrollController: scrollController,
                              podcasts: podcasts,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          PopularGrid(
            podcasts: podcasts,
          ),
        ],
      ),
      loading: () => const PopularShimmer(),
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
    );
  }
}
