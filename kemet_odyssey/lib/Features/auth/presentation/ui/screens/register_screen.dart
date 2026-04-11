import 'package:flutter/material.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/common_widgets/build_background_image.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/register_widgets/register_body.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image — a temple/ancient city vibe
          BuildBackgroundImage(
            imagePath: 'lib/Core/assets/images/image2.png',
            color: Colors.black.withOpacity(isDark ? 0.05 : 0.05),
          ),
          const BuildGrediant(),
          // Content
          const RegisterBody(),
        ],
      ),
    );
  }

}

class BuildGrediant extends StatelessWidget {
  const BuildGrediant({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return 
        Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.scaffoldBackgroundColor.withOpacity(0.5),
            theme.scaffoldBackgroundColor.withOpacity(0.2),
            Colors.transparent.withOpacity(0.3),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.0, 0.25, 1.0],
        ),
      ),
    );
  }
}
