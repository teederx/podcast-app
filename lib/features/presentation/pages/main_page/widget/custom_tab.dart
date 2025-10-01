import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.iconData, required this.label});
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(iconData), 2.horizontalSpace, Text(label)],
      ),
    );
  }
}