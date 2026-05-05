import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/common_widgets/build_custom_button.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/common_widgets/build_login_with_buttons.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/login_widgets/build_text_field.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/login_widgets/forgot_password_dialog.dart';

class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({
    super.key,
    required this.theme,
    required this.isDark,
  });

  final ThemeData theme;
  final bool isDark;

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.pushNamed('home');
        } else if (state is AuthFailure) {
          print(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: widget.theme.textTheme.labelSmall?.copyWith(
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 8),
            BuildTextField(
              controller: emailController,
              theme: widget.theme,
              obscureText: false,
              hintText: "email@kemet.com",
              prefixIcon: Icon(Icons.alternate_email,
                  color: widget.theme.colorScheme.outline),
            ).animate().fadeIn(delay: 500.ms).slideX(begin: 0.1, end: 0),
            const SizedBox(height: 24),
            Text(
              'Password',
              style: widget.theme.textTheme.labelSmall?.copyWith(
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn(delay: 600.ms),
            const SizedBox(height: 8),
            BuildTextField(
              controller: passController,
              theme: widget.theme,
              obscureText: true,
              hintText: '••••••••',
              prefixIcon: Icon(Icons.lock_outline,
                  color: widget.theme.colorScheme.outline),
            ).animate().fadeIn(delay: 700.ms).slideX(begin: 0.1, end: 0),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  final authCubit = context.read<AuthCubit>();
                  showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: 'Dismiss',
                    transitionDuration: const Duration(milliseconds: 400),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        BlocProvider.value(
                      value: authCubit,
                      child: ForgotPasswordDialog(
                        theme: widget.theme,
                        isDark: widget.isDark,
                      ),
                    ),
                  );
                },
                child: (state is AuthLoading)
                    ? const CircularProgressIndicator(
                        color: AppColors.darkPrimary,
                      )
                    : Text(
                        'Forget Password?',
                        style: widget.theme.textTheme.labelSmall?.copyWith(
                          color: widget.isDark
                              ? AppColors.darkPrimary
                              : AppColors.darkPrimary,
                        ),
                      ),
              ),
            ).animate().fadeIn(delay: 800.ms),
            const SizedBox(height: 16),
            BuildCustomButton(
              title: Text(
                "SIGN IN",
                style: widget.theme.textTheme.labelLarge?.copyWith(
                  color: Colors.white.withOpacity(0.99),
                  fontWeight: FontWeight.bold,
                ),
              ),
              iconData: Icons.arrow_forward,
              onPressed: () {
                context.read<AuthCubit>().signinWithEmail(
                    email: emailController.text, password: passController.text);
              },
            ).animate().fadeIn(delay: 900.ms).slideY(begin: 0.2, end: 0),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                    child:
                        Divider(color: AppColors.darkPrimary.withOpacity(0.6))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'OR CONTINUE WITH',
                    style: widget.theme.textTheme.labelSmall
                        ?.copyWith(color: AppColors.darkPrimary),
                  ),
                ),
                Expanded(
                    child:
                        Divider(color: AppColors.darkPrimary.withOpacity(0.6))),
              ],
            ).animate().fadeIn(delay: 1000.ms),
            const SizedBox(height: 24),
            BuildLoginWithButtons(theme: widget.theme)
                .animate()
                .fadeIn(delay: 1100.ms)
                .slideY(begin: 0.2, end: 0),
          ],
        );
      },
    );
  }
}
