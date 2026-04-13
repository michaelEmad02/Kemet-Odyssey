import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/screens/place_details_screen.dart';

class BuildGalleryImages extends StatefulWidget {
  const BuildGalleryImages(
      {super.key, required this.galleryImages, required this.isDark});

  final List<String> galleryImages;
  final bool isDark;

  @override
  State<BuildGalleryImages> createState() => _BuildGalleryImagesState();
}

class _BuildGalleryImagesState extends State<BuildGalleryImages> {
  int activeImage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.43,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.88),
            itemCount: [widget.galleryImages].length,
            onPageChanged: (i) => setState(() => activeImage = i),
            itemBuilder: (context, i) =>
                BuildGalleryImage(url: widget.galleryImages[i]),
          ),
        ),
        // Dot Indicators
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.galleryImages.length,
              (i) => AnimatedContainer(
                duration: 300.ms,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: i == activeImage ? 20 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: i == activeImage
                      ? (widget.isDark
                          ? AppColors.darkPrimary
                          : AppColors.lightPrimary)
                      : Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 200.ms);
  }
}