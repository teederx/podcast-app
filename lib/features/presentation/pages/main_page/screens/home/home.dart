import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_app/features/presentation/pages/main_page/screens/home/widget/popular/popular.dart';

import 'widget/bookmarked/bookmarked.dart';
import 'widget/tab_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tabbar(
          onSubmittedComplete: (String query) {
            // TODO: Perform action to search through all the podcasts
          },
        ),
        20.verticalSpace,
        Expanded(
          child: ListView(
            children: [
              Container(
                height: 150.h,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              10.verticalSpace,
              Bookmarked(),
              10.verticalSpace,
              Divider(
                color: Colors.grey[700],
                thickness: 0.2.h,
              ),
              5.verticalSpace,
              Popular(),
            ],
          ),
        ),
      ],
    );
  }
}
