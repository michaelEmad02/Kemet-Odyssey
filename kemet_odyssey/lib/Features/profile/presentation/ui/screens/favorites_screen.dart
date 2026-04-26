import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/widgets/favorites/build_favorites_body.dart';

enum FavoriteCardType { featured, square, vertical, discover }

class FavoriteItem {
  final String title;
  final String? subtitle;
  final String? imageUrl;
  final FavoriteCardType type;

  const FavoriteItem({
    required this.title,
    this.subtitle,
    this.imageUrl,
    required this.type,
  });
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  static const List<FavoriteItem> _favoriteItems = [
    FavoriteItem(
      title: 'Luxor Temple Complex',
      subtitle: 'THEBES',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBOKwWaPhCEVCDufVN_CBv15va1lLo1vfxnM92NZqgGFUcVZv4Yfh0bi2_1Xgke2a1A1jfNzqvH3qRZfn6xRov2NYSC-AUdy-cSsgp2BfUv5ns4W2GcTPHX-48cLi-SCAjweOAvWBYbxAm1hbEeFWadifCNHbEO67-SIFRRyxlMIIkeijcxdALIzJ4w99c9Qvn53aWaTvaM2kTJlQGa0l168DpTEPoXJ1Wmvg6pmivMsVlEFSh0ls7yj7UKHDsBBoRm-pvsu9mWkP8',
      type: FavoriteCardType.featured,
    ),
    FavoriteItem(
      title: 'Valley of the Kings',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCqSBU_6qooUBUMcFuUJWE43FqjgP5CCS0rBEWFko-TgM0TmP2bgqfOOanx861HuwyRdJKzN-yZ_QoTnmX3Gb2u4lMAoXzVQZjx8BYRPee2-Sk8daEXPFV-gTYO7D0JiCtAizfRMCNZLbmPbuz1VxToAlDWk9VJZF3dGjjjHhf13ToE3rRteTSYD1ETYb-XR6B57eVBTbwgvdIdIyoZSkEdkYVPviIK9Ziu6SPnVPVbhCebZ0kmqTsIkhdfRgEo0rThwmhjkJfMbTo',
      type: FavoriteCardType.square,
    ),
    FavoriteItem(
      title: 'Nile Sail Voyage',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCrDAZFE-A9wEDllwRxFFA38YJGNLl9ofZvgkvIY68FOndqLJ-9Rhd1Dg-uOsJCMNYOfcPrvlMizNpBFuqx8ApHmaiCotewBo4KTiKLKXp6siv27In7I18clixAaMRrp-sEeSuWtIdNRr9vOA3bEJmR_iUvKLPQC811-5CvB6iomkVPGdtfT1rPHv3yHalNwYaKPkGGzcwEAKursPdnQ4q_KuaH-dQu2GEFoEAmLPoSaG7-SF3AuXIIKabKckfRee-YuI1xR617e8Q',
      type: FavoriteCardType.vertical,
    ),
    FavoriteItem(
      title: 'Temple of Philae',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBzO5dim9uFHjAYC9YtIfG_-T_jxvRG9D9mx6u6YZGOcPMHeOWqi-ZTv2VBlHUHNRdMdjdR3z7148--8xCd-ec3F8OdcJrOo5BLA_PneJLD2ltBvfxcPBC73y4ICYe6gK-oMOZnJ_6ilovMJ7M6iZgBB0Laj6pB_DQqUeZRN6_9mT-Az6uL2VQip0pSzT6HV2wqzNqmo3LgBhJd67rVMt8vGAKjRMXWitP1prDyL5MzCati9W-ZwiEn2aS8biglAQZo8Pi0G53fRq8',
      type: FavoriteCardType.vertical,
    ),
    FavoriteItem(
      title: 'Discover more',
      imageUrl: null,
      type: FavoriteCardType.discover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(theme, isDark),
      body: BuildFavoritesBody(theme: theme, favoriteItems: _favoriteItems),
    );
  }

  AppBar _buildAppBar(ThemeData theme, bool isDark) {
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
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAwPRfbzmvhZmwFPULTtJBaUs9vpFEyzpSDNPGC9Oxi2CszPZO7PPlrqkS_6BRiBtyUE3XhO1mMsRWPkI27rU-hieMqgXlwuThGCbWRtrXtY--j-1JGxnd43Meu71G6W4H0C91QdiEEVymNYs6zQC1tndeRZefi0RxGPOgqm32wR4CnQS6oSzHqv2GMfSRXdapYJDGrlP0KMGyROPZXUqKRvjHVTYVzzENbg-I4LbLPjNHQQLFPAxltdyC5btTleYuGf1jTKSrenNM'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
