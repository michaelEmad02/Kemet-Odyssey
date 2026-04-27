import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/core/utils/service_locator.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/fetch_destinations_data_cubit.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/explore_cities/build_explore_cities_body.dart';

class CityExplorerItem {
  final String title;
  final String subtitle;
  final String imageUrl;
  final IconData? icon;
  final bool isFeatured;

  const CityExplorerItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.icon,
    this.isFeatured = false,
  });
}

class ExploreCitiesScreen extends StatefulWidget {
  const ExploreCitiesScreen({super.key});

  @override
  State<ExploreCitiesScreen> createState() => _ExploreCitiesScreenState();
}

class _ExploreCitiesScreenState extends State<ExploreCitiesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => getIt<FetchDestinationsDataCubit>()..fetchCitiesData(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildCitiesAppBar(theme, isDark),
        body: BlocBuilder<FetchDestinationsDataCubit, FetchDestinationsDataState>(
          builder: (context, state) {
            if (state is FetchDestinationsDataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchDestinationsDataError) {
              return Center(child: Text(state.errorMessage));
            } else if (state is FetchDestinationsDataLoaded) {
              final explorerItems = state.cities.map((city) {
                return CityExplorerItem(
                  title: city.name,
                  subtitle: city.description,
                  imageUrl: city.imageUrl,
                  isFeatured: false, // Defaulting to false for now
                );
              }).toList();

              return BuildExploreCitiesBody(
                theme: theme,
                isDark: isDark,
                explorerItems: explorerItems,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  AppBar buildCitiesAppBar(ThemeData theme, bool isDark) {
    return AppBar(
      flexibleSpace: const ClipRect(
        child: BackdropFilter(
          filter: MainAxisAlignment.center == MainAxisAlignment.start
              ? null
              : ColorFilter.mode(Colors.transparent, BlendMode.srcOver)
                  as dynamic,
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

