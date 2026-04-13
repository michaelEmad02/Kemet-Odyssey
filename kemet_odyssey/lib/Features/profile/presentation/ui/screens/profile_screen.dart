import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/widgets/profile/build_profile_body.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(theme, isDark),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 20,
          bottom: 120, // Bottom nav space
          left: 24,
          right: 24,
        ),
        child: BuildProfileBody(theme: theme),
      ),
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
