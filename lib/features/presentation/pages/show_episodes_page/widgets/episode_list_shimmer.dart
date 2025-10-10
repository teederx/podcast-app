import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EpisodeListShimmer extends StatelessWidget {
  const EpisodeListShimmer({super.key, this.count = 6});

  final int count;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: count,
      separatorBuilder: (_, __) => SizedBox(height: 12),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[800]!,
          highlightColor: Colors.grey[600]!,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 16, width: 180, color: Colors.white),
                    SizedBox(height: 8),
                    Container(
                        height: 14,
                        width: double.infinity,
                        color: Colors.white),
                    SizedBox(height: 6),
                    Container(height: 14, width: 120, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
