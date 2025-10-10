import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_app/features/presentation/pages/show_episodes_page/widgets/episode_list_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class EpisodeShimmer extends StatelessWidget {
  const EpisodeShimmer({super.key, this.count = 2});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Container(
              height: 20.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          10.verticalSpace,
          EpisodeListShimmer(
            count: count,
          ),
        ],
      ),
    );
  }
}
