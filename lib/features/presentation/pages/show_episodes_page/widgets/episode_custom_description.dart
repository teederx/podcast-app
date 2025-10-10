
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EpisodeCustomDescription extends StatefulWidget {
  const EpisodeCustomDescription({super.key, required this.desc});

  final String desc;

  @override
  State<EpisodeCustomDescription> createState() =>
      _EpisodeCustomDescriptionState();
}

class _EpisodeCustomDescriptionState extends State<EpisodeCustomDescription>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(10.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description:',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          10.horizontalSpace,
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutCubic,
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: isExpanded ? 250.h : 100.h,
              ),
              child: ClipRect(
                child: SingleChildScrollView(
                  physics: isExpanded
                      ? const BouncingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Html(
                      key: ValueKey(isExpanded), // 👈 required for switcher
                      data: widget.desc,
                      style: {
                        "body": Style(
                          textAlign: TextAlign.justify,
                          maxLines: isExpanded ? null : 4,
                          textOverflow: isExpanded
                              ? TextOverflow.clip
                              : TextOverflow.ellipsis,
                        ),
                        "p": Style(
                          margin: Margins.all(0),
                          padding: HtmlPaddings.all(0),
                        ),
                        "a": Style(
                          color: Colors.grey[600],
                          textDecoration: TextDecoration.underline,
                        ),
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) =>
                    FadeTransition(opacity: anim, child: child),
                child: Text(
                  isExpanded ? 'Show Less' : 'Show More',
                  key: ValueKey(isExpanded), // 👈 required for switcher
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
