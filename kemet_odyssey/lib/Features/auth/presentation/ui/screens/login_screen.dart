import 'package:flutter/material.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/common_widgets/build_background_image.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/login_widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          BuildBackgroundImage(
            imagePath: 'lib/Core/assets/images/image2.png',
            color: Colors.black.withOpacity(isDark ? 0.02 : 0.03),
          ),
          // Gradient Layer
          BuildGradiant(theme: theme),
          // Content
          LoginScreenBody(theme: theme, isDark: isDark),
        ],
      ),
    );
  }
}



class BuildGradiant extends StatelessWidget {
  const BuildGradiant({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.scaffoldBackgroundColor.withOpacity(0.8),
            Colors.transparent.withOpacity(0.1),
            theme.scaffoldBackgroundColor.withOpacity(0.4),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}
