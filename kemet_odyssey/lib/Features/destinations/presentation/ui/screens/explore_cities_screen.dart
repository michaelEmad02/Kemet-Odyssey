import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
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

class ExploreCitiesScreen extends StatelessWidget {
  const ExploreCitiesScreen({super.key});

  static const List<CityExplorerItem> _explorerItems = [
    CityExplorerItem(
      title: 'Cairo',
      subtitle: 'The Triumphant City',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBxUuOlXXGS3Rxrv28UYMvBXctqUY4y59tun02vldTNnnVpKUB-uLg_VxjHkXpFO-zJYfJOq7nMxugnHmb_mX4LLx02cW3PlvkTXDBvszZYap7ZZZTtmGC7UxXmvTa8CTx2L7iEYlq1Ss_Ddxm1TOFoG3Utp8Invc7Chq_XtvZf4fUgkpJrTRyuHSMFG1c5l5c1hwo0G80onCiURQbElnunBMFTST126m-mCCdWBWCzrLq7n5MiFM5wnG193FiWPU5ladSGGWmQGO8',
      isFeatured: true,
    ),
    CityExplorerItem(
      title: 'Luxor',
      subtitle: 'The World\'s Greatest Open-Air Museum',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBxIJdeRvh0FJUCmyzS0PBYbzhKAgkJ-tFA1eFvsF38OqO0zSJGI3_ZoIIjj9KfrUR9e_cfdg6GUue-W8cbTkMeCq_L73l2Z78A6FHkEx8uX2ElhwDfhjYfIM-9zVm-B5KU0gDXaG4Qta4HxWWJ3QcV8IHkkdAV3PFSHXM2MaWvhrTw4iOsxNvnjYNehWD2y6PhRwEjax3wv417cTnyFBrr8GrgJBvd34H3uxeHR7xN0k-tx38fbEC1sRc46KRFUqWmf3FqBMqb9kI',
    ),
    CityExplorerItem(
      title: 'Aswan',
      subtitle: 'Serenity of the First Cataract',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDeS5UHXlmzWVXVehps4j4NiD-9OML5601XxKRRCmxqt_S5IEgTTnjDly-40td_0vgKEkKHaFZaPbIQdMykp0aykhfNy_ZsvcLZ-TQd0x5hmsuibktP4pPTGtGsF2QWPcnh2cAlpu_S34VERfb_W5lVGs5R9CDLlcuhONHRdfg9K1tPERpcvS6c7CnyO7Nw7UJU2E3HFU9lgbvS61qnUaMR8To-swHHcSqnFYgzJ7fmWr3RFZ_a__lLWqzIeoP9URJ9N0FYtAXLLh4',
      icon: Icons.directions_boat,
    ),
    CityExplorerItem(
      title: 'Alexandria',
      subtitle: 'The Pearl of the Mediterranean',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDquoYs8JLZ_tPqvoVt3Xb-vY2gsNI_evlHKTcEtOM_l1m0lyE6l1zWyyJd7CydOgNrmaCAT2Cx-LcWXi4xrBHs03XBd6fw_lIA3oP3xRO6AiND7Dx903-Ag3Bw2rSKa_Up8VVyGJXTnC5Xm_7lvQRV9czUBkrHa-zrovjz8PXasGZ0iN1ZWS_g8xAIrmY_AW-WKdCp8gsyT0ZmJLdOrQkcLFlHF7KUc1njmdS7k89AQ_VQ_Ror3lHTywyUuXNjozfvF-knPNMlr94',
    ),
    CityExplorerItem(
      title: 'Sharm',
      subtitle: 'Jewel of the Red Sea',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuC90Fjv5FzWvKlXCUpwqx8ZANUmxDU2L0veNCZ4QB-UmO1vSqstmjeqOcsYuy_9oXqw6H999HYjOlYpRnebtI7bJihqzJJQ3BD8-waQNejDp6cZDGVOKSdwo5KNr23Mdqp4c_drzm0jNbAf3W-ywHaqGzZQ9DuWOSbjCdJv6o3h9eo-4tehfV6W7W6A-amOhkPQOrxrDh5AQ8AcOYzSSO5WExdW5FuAJCCXgULT44RJjpZTnicfqBugO-YOdpZa21NJLZCIeEzu9rI',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildCitiesAppBar(theme, isDark),
      body: BuildExploreCitiesBody(theme: theme, isDark: isDark, explorerItems: _explorerItems),
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
