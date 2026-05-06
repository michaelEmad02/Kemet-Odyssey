import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kemet_odyssey/core/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/core/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/home/domain/entities/plan_entity.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<CityEntity> _cities = [];

  static final List<PlaceEntity> _places = [];

  static const List<PlanEntity> _plans = [
    PlanEntity(
      id: '1',
      duration: '7 DAYS',
      city: 'Cairo',
      categories: ['Archeologist', 'tsrtd', 'sfdsg', 'sdgsdgsdgsdg'],
      imageUrl: "",
      isPremium: false,
      price: 0,
      averageRating: 4,
      ratingCount: 50,
      subscribers: 0,
    ),
    PlanEntity(
      id: '2',
      duration: '4 DAYS',
      city: 'Giza',
      categories: ['tejkdsjhsdu'],
      imageUrl: "",
      isPremium: false,
      price: 0,
      averageRating: 3.9,
      ratingCount: 70,
      subscribers: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Responsive logic
    // final screenWidth = MediaQuery.of(context).size.width;
    // Define card widths relatively based on screen size, with reasonable caps.
    // final cityCardWidth = (screenWidth * 0.60).clamp(250.0, 400.0);
    // final placeCardWidth = (screenWidth * 0.60).clamp(240.0, 350.0);
    // final planCardWidth = (screenWidth * 0.85).clamp(320.0, 450.0);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(theme, isDark),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 24.0), // Above bottom nav
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     backgroundColor:
      //         isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
      //     foregroundColor: AppColors.darkOnPrimary, // Always dark for gold
      //     elevation: 8,
      //     child: const Icon(Icons.add),
      //   ),
      // ),
      body: HomeBody(
        theme: theme,
        isDark: isDark,
        cities: _cities,
        places: _places,
        plans: _plans,
      ),
    );
  }

  AppBar buildAppBar(ThemeData theme, bool isDark) {
    return AppBar(
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: Colors.transparent),
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.8),
      leading: IconButton(
        icon: Icon(Icons.menu,
            color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary),
        onPressed: () {},
      ),
      title: Text(
        'Kemet Odyssey',
        style: theme.textTheme.headlineSmall?.copyWith(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: theme.colorScheme.primary.withOpacity(0.3), width: 2),
              image: const DecorationImage(
                image: CachedNetworkImageProvider(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuD6pHsVOsiAvczga7MnXb1sOcBqTGSjd9iLP2EsfBOubH_UEL-Op-EtRQ0K6_jnDggiuP1ep7L_1lP202NiLqTB5LvWCXGCOuPLIX1mUvnFNH66aui6RiXAjU8d-6JbgO0cjjv33B7TnVueFG_GLBSbqpA-6iBepjx184JEe_4aydvtDZ-giujvpDoSkDn-sEEMJLn03wwfAqvrrj8UJTxd2B3wtOAuaGZk8bujrTWX36XJUGn1uZbBrAJaEFZmlu-6aY2swb0lX4g'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
