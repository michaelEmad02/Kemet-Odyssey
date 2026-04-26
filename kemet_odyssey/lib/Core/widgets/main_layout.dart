import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

import 'package:kemet_odyssey/core/theme/app_colors.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayout({super.key, required this.navigationShell});

  void _onItemTapped(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: navigationShell,
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: isDark ? const Color(0xCC131313) : const Color(0xCCFFF8F4), // Slightly transparent background
            padding: const EdgeInsets.only(bottom: 16, top: 12),
            child: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              elevation: 0,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
              unselectedItemColor: theme.colorScheme.outline,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, letterSpacing: 1),
              onTap: (index) => _onItemTapped(index, context),
              items: const [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.home),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.home, fill: 1), // Using filled icon visually
                  ),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.explore_outlined),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.explore),
                  ),
                  label: 'EXPLORE',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.auto_awesome),
                  ),
                  label: 'PLAN',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.favorite_outline),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.favorite),
                  ),
                  label: 'FAVORITES',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.person_outline),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.person),
                  ),
                  label: 'PROFILE',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
