import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({
    super.key,
    this.title = 'Welcome Back!',
    this.subtitle = "Find today's best podcasts",
    this.hintText = "Search podcasts...",
    required this.onSubmittedComplete,
  });

  final String title;
  final String subtitle;
  final String hintText;
  final Function(String) onSubmittedComplete;

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  bool _showSearch = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // left side
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1,
                child: child,
              ),
            ),
            child: _showSearch
                ? TextField(
                    key: ValueKey('searchField'),
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      filled: true,
                      fillColor: Colors.grey[800],
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onEditingComplete: () {
                      widget.onSubmittedComplete(_controller.text);
                      FocusScope.of(context).unfocus();
                    },
                  )
                : Column(
                    key: ValueKey('welcomeText'),
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
          ),
        ),

        // right side (icon button)
        IconButton(
          icon: Icon(_showSearch ? Icons.close : Icons.search),
          style: IconButton.styleFrom(
            backgroundColor: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            iconSize: 24.sp,
          ),
          onPressed: () {
            setState(() {
              _showSearch = !_showSearch;
            });
          },
        ),
      ],
    );
  }
}
