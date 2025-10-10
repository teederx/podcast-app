import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_app/features/presentation/pages/show_episodes_page/show_episodes_page.dart';

import '../../../../../data/model/podcast/podcast_data.dart';
import '../home/widget/custom_tile.dart';

class AllPodcasts extends StatelessWidget {
  const AllPodcasts(
      {super.key, required this.scrollController, required this.podcasts});
  final ScrollController scrollController;
  final List<PodcastData> podcasts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Text(
            "Popular Podcasts",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: AllPodcastsList(
              scrollController: scrollController,
              count: 20,
              podcasts: podcasts,
            ),
          ),
        ],
      ),
    );
  }
}

class AllPodcastsList extends StatelessWidget {
  const AllPodcastsList({
    super.key,
    this.count = 10,
    required this.scrollController,
    required this.podcasts,
  });

  final int count;
  final ScrollController scrollController;
  final List<PodcastData> podcasts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      separatorBuilder: (context, index) => 10.verticalSpace,
      itemBuilder: (context, index) {
        final podcast = podcasts[index];
        return CustomTile(
          title: podcast.title,
          subtitle: podcast.publisher,
          imageUrl: podcast.image,
          onPressed: () {
            Navigator.pushNamed(
              context,
              ShowEpisodesPage.routeName,
              arguments: podcast,
            );
          },
          showSaveIcon: false,
        );
      },
      itemCount: count,
      shrinkWrap: true,
    );
  }
}
