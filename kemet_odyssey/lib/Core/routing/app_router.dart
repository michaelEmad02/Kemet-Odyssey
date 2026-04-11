import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/screens/login_screen.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/screens/register_screen.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/screens/splash_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
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
    ],
  );
}
