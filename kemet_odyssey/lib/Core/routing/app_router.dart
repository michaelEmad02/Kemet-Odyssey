import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/core/widgets/main_layout.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/screens/login_screen.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/screens/register_screen.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/screens/splash_screen.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/screens/city_details_screen.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/screens/explore_cities_screen.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/screens/place_details_screen.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/screens/home_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        pageBuilder: (context, state) => const MaterialPage(
          child: SplashScreen(),
        ),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        pageBuilder: (context, state) => const MaterialPage(
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (context, state) => const MaterialPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/exploreCities',
        name: 'exploreCities',
        pageBuilder: (context, state) => const MaterialPage(
          child: ExploreCitiesScreen(),
        ),
      ),
      GoRoute(
        path: '/city/:id',
        name: 'city_details',
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final id = state.pathParameters['id'] ?? 'luxor';
          return MaterialPage(child: CityDetailsScreen(cityId: id));
        },
      ),
      GoRoute(
        path: '/place/:id',
        name: 'place_details',
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final id = state.pathParameters['id'] ?? 'karnak';
          return MaterialPage(child: PlaceDetailsScreen(placeId: id));
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                name: 'home',
                pageBuilder: (context, state) =>
                    const MaterialPage(child: HomeScreen()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
