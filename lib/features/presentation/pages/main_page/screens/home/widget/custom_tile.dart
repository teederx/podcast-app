import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    this.title = "",
    this.subtitle = "",
    this.imageUrl,
    this.onPressed,
    this.onSaveIconPressed,
    this.showSaveIcon = true,
    this.isSaved = false,
  });

  final String title;
  final String subtitle;
  final String? imageUrl;
  final VoidCallback? onPressed;
  final VoidCallback? onSaveIconPressed;
  final bool showSaveIcon;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            width: 70.h,
            height: 70.h,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(12.r),
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          if (showSaveIcon)
            IconButton(
              icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline),
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                iconSize: 30.sp,
                foregroundColor: Colors.white,
              ),
              onPressed: onSaveIconPressed,
            ),
        ],
      ),
    );
  }
}
