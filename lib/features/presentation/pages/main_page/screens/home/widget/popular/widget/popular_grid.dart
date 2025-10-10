import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../data/model/podcast/podcast_data.dart';
import '../../../../../../show_episodes_page/show_episodes_page.dart';

class PopularGrid extends StatelessWidget {
  const PopularGrid({
    super.key,
    required this.podcasts,
  });

  final List<PodcastData> podcasts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        padding: EdgeInsets.only(right: 15.w),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final podcast = podcasts[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                ShowEpisodesPage.routeName,
                arguments: podcast,
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 12.w),
              width: 170.w,
              height: 150.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 170.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(20.r),
                      image: podcast.image.isEmpty
                          ? null
                          : DecorationImage(
                              image: NetworkImage(podcast.image),
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(120),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      podcast.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
