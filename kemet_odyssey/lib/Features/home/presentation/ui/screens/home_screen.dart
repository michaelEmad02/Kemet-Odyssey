import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/core/utils/service_locator.dart';
import 'package:kemet_odyssey/features/home/presentation/manager/bloc/fetch_top_cities_bloc.dart';
import 'package:kemet_odyssey/features/home/presentation/manager/bloc/fetch_top_places_bloc.dart';
import 'package:kemet_odyssey/features/home/presentation/manager/bloc/fetch_top_plans_bloc.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<FetchTopCitiesBloc>()..add(FetchTopCities()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<FetchTopPlacesBloc>()..add(FetchTopPlaces()),
        ),
        BlocProvider(
          create: (context) => getIt<FetchTopPlansBloc>()..add(FetchTopPlans()),
        ),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(theme, isDark),
        body: HomeBody(
          theme: theme,
          isDark: isDark,
        ),
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
