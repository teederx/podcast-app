import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_app/features/presentation/pages/main_page/screens/home/home.dart';
import 'package:podcast_app/features/presentation/pages/main_page/widget/custom_tab_bar.dart';

import 'screens/saved/saved.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
            child: TabBarView(
              children: [
                Home(),
                Saved(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomTabBar(),
      ),
    );
  }
}
