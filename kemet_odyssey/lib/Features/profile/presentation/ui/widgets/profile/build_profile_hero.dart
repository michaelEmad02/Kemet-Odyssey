import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildProfileHero extends StatelessWidget {
  const BuildProfileHero({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 140,
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.primaryContainer
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56),
                color: theme.scaffoldBackgroundColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(56),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuD6pHsVOsiAvczga7MnXb1sOcBqTGSjd9iLP2EsfBOubH_UEL-Op-EtRQ0K6_jnDggiuP1ep7L_1lP202NiLqTB5LvWCXGCOuPLIX1mUvnFNH66aui6RiXAjU8d-6JbgO0cjjv33B7TnVueFG_GLBSbqpA-6iBepjx184JEe_4aydvtDZ-giujvpDoSkDn-sEEMJLn03wwfAqvrrj8UJTxd2B3wtOAuaGZk8bujrTWX36XJUGn1uZbBrAJaEFZmlu-6aY2swb0lX4g',
                  fit: BoxFit.cover,
                  color: Colors.white
                      .withOpacity(0.8), // grayscale effect roughly
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
