import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_tab.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        color: Colors.black,
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        indicator: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15.r),
        ),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs: [
          CustomTab(iconData: Icons.home_outlined, label: "Home"),
          CustomTab(iconData: Icons.bookmark_rounded, label: "Saved"),
        ],
      ),
    );
  }
}
