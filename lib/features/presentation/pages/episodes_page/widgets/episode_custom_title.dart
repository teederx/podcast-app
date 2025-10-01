import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EpisodeCustomTitle extends StatelessWidget {
  const EpisodeCustomTitle({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.isBookmarked = false,
    required this.onPressed,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final bool isBookmarked;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                    image: NetworkImage(
                  imageUrl,
                )),
              ),
            ),
            SizedBox(
              width: 200.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: onPressed,
              icon: Icon(isBookmarked
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_border_rounded),
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
