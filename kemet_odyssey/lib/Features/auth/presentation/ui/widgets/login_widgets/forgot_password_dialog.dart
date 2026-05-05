import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/common_widgets/build_custom_button.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/login_widgets/build_text_field.dart';

class ForgotPasswordDialog extends StatefulWidget {
  final ThemeData theme;
  final bool isDark;

  const ForgotPasswordDialog({
    super.key,
    required this.theme,
    required this.isDark,
  });

  @override
  State<ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: widget.isDark
                ? widget.theme.scaffoldBackgroundColor.withOpacity(0.85)
                : widget.theme.scaffoldBackgroundColor.withOpacity(0.95),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.darkPrimary.withOpacity(0.5),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkPrimary.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: -5,
              ),
            ],
          ),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is PasswordResetSuccess) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Password reset link has been sent!'),
                    backgroundColor: AppColors.darkPrimary,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              } else if (state is AuthFailure) {
                setState(() {
                  _errorMessage = state.errorMessage;
                });
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reset Password',
                          style: widget.theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: widget.isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: widget.isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Enter your email address and we will send you a link to reset your password.',
                      style: widget.theme.textTheme.bodyMedium?.copyWith(
                        color: widget.isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Email',
                      style: widget.theme.textTheme.labelSmall?.copyWith(
                        color: widget.isDark
                            ? Colors.white.withOpacity(0.7)
                            : Colors.black87.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    BuildTextField(
                      controller: _emailController,
                      theme: widget.theme,
                      obscureText: false,
                      hintText: "email@kemet.com",
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: widget.theme.colorScheme.outline,
                      ),
                      // Basic validation could be added here if BuildTextField supports it
                    ),
                    if (_errorMessage != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        _errorMessage!,
                        style: widget.theme.textTheme.bodySmall?.copyWith(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    const SizedBox(height: 32),
                    state is AuthLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.darkPrimary,
                            ),
                          )
                        : BuildCustomButton(
                            title: Text(
                              "SEND LINK",
                              style: widget.theme.textTheme.labelLarge?.copyWith(
                                color: Colors.white.withOpacity(0.99),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            iconData: Icons.send_rounded,
                            onPressed: () {
                              if (_emailController.text.trim().isNotEmpty) {
                                setState(() {
                                  _errorMessage = null;
                                });
                                context.read<AuthCubit>().resetPasword(
                                      emailAddress: _emailController.text.trim(),
                                    );
                              } else {
                                setState(() {
                                  _errorMessage = 'Please enter a valid email';
                                });
                              }
                            },
                          ),
                  ],
                ),
              );
            },
          ),
        ).animate()
         .fadeIn(duration: 400.ms, curve: Curves.easeOutQuad)
         .scaleXY(begin: 0.8, end: 1.0, duration: 400.ms, curve: Curves.easeOutBack),
      ),
    );
  }
}
