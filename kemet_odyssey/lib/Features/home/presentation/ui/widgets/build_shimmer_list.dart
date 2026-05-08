import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmerList extends StatelessWidget {
  const BuildShimmerList({
    super.key,
    required this.isDark,
    required this.context,
    required this.height,
  });

  final bool isDark;
  final BuildContext context;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.7,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            );
          },
        ),
      ),
    );
  }
}
