import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CityCardShimmer extends StatelessWidget {
  const CityCardShimmer({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // Darker gray for base
      highlightColor: Colors.grey[100]!, // Slightly lighter gray for highlight
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 18,
                    width: MediaQuery.of(context).size.width * 0.4,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 15,
                    width: MediaQuery.of(context).size.width * 0.6,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
