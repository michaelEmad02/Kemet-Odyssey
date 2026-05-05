import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/Features/auth/presentation/ui/widgets/splash_widget/footer.dart';
import 'package:kemet_odyssey/Features/auth/presentation/ui/widgets/splash_widget/signin_button.dart';
import 'package:kemet_odyssey/core/utils/service_locator.dart';
import 'package:kemet_odyssey/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/common_widgets/build_background_image.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/common_widgets/build_custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          BuildBackgroundImage(
            imagePath: 'lib/core/assets/images/image6.png',
            color: Colors.black.withOpacity(isDark ? 0.00 : 0.05),
          ),
          const _GradientOverlay(),
          BlocProvider(
            create: (context) =>  getIt<AuthCubit>(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 48.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _BrandSection(),
                    _ActionsSection(theme: theme),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Gradient Overlay
// ─────────────────────────────────────────────

class _GradientOverlay extends StatelessWidget {
  const _GradientOverlay();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.scaffoldBackgroundColor.withOpacity(0.8),
            Colors.transparent.withOpacity(0.3),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Brand Section (Title + Tagline)
// ─────────────────────────────────────────────

class _BrandSection extends StatelessWidget {
  const _BrandSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        const SizedBox(height: 100),
        const SizedBox(height: 24),
        Text(
          'Kemet Odyssey',
          textAlign: TextAlign.center,
          style: theme.textTheme.displayLarge?.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkPrimary : AppColors.darkPrimary,
            shadows: [
              Shadow(
                color: AppColors.darkPrimary.withOpacity(0.1),
                blurRadius: 20,
              ),
            ],
          ),
        ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 30),
        Text(
          'Begin Your Odyssey Through Ancient Egypt',
          style: theme.textTheme.labelLarge?.copyWith(
            color: Colors.white.withOpacity(0.9),
            letterSpacing: 2.0,
            overflow: TextOverflow.clip,
          ),
        ).animate().fadeIn(delay: 500.ms),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// Actions Section (Buttons + Footer)
// ─────────────────────────────────────────────

class _ActionsSection extends StatelessWidget {
  const _ActionsSection({required this.theme});

  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildCustomButton(
          title: Text("BEGIN EXPEDITION",
              style: theme.textTheme.labelLarge?.copyWith(
                color: Colors.white.withOpacity(0.99),
                fontWeight: FontWeight.bold,
              )),
          iconData: Icons.arrow_forward,
          onPressed: () => context.goNamed('home'),
        ).animate().fadeIn(delay: 900.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 16),
        const SignInButton(),
        const SizedBox(height: 48),
        const FooterQuote(),
      ],
    );
  }
}
