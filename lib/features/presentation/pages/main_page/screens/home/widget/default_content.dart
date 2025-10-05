import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bookmarked/bookmarked.dart';
import 'images_card.dart';
import 'popular/popular.dart';

class DefaultContent extends StatelessWidget {
  const DefaultContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ImagesCard(),
        10.verticalSpace,
        const Bookmarked(),
        10.verticalSpace,
        Divider(
          color: Colors.grey[700],
          thickness: 0.2.h,
        ),
        5.verticalSpace,
        const Popular(),
      ],
    );
  }
}
