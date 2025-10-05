import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dots_indicator.dart';

class ImagesCard extends StatefulWidget {
  const ImagesCard({super.key});

  @override
  State<ImagesCard> createState() => _ImagesCardState();
}

class _ImagesCardState extends State<ImagesCard> {
  final duration = const Duration(milliseconds: 300);
  final int _imageCount = 3;
  int _currentImageIndex = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startImageSlider();
  }

  void _startImageSlider() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _currentImageIndex = (_currentImageIndex + 1) % _imageCount;
        });
      }
    });
  }

  void _onDotTapped(int index) {
    if (mounted) {
      setState(() {
        _currentImageIndex = index;
      });
      _startImageSlider();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedSwitcher(
          duration: duration,
          transitionBuilder: (Widget child, Animation<double> animation) {
            const beginOffset = Offset(1.0, 0.0);
            return SlideTransition(
              position: Tween<Offset>(
                begin: beginOffset,
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: Container(
            key: ValueKey<int>(_currentImageIndex),
            height: 200.h,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/image-${_currentImageIndex + 1}.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        10.verticalSpace,
        DotsIndicator(
          currentPageIndex: _currentImageIndex,
          length: _imageCount,
          onDotTapped: _onDotTapped,
        ),
      ],
    );
  }
}
