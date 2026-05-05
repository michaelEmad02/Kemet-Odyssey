import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/auth/presentation/manager/cubit/auth_cubit.dart';

class BuildLoginWithButtons extends StatelessWidget {
  const BuildLoginWithButtons({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            // Handle Google login
            context.read<AuthCubit>().signinWithGoogle();
          },
          child: Container(
            height: 50,
            width: 70,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: theme.colorScheme.outlineVariant.withOpacity(0.1)),
            ),
            child: const Center(child: Icon(Icons.g_mobiledata, size: 32)),
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            
          },
          child: Container(
            height: 50,
            width: 70,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: theme.colorScheme.outlineVariant.withOpacity(0.1)),
            ),
            child: const Center(child: Icon(Icons.apple, size: 24)),
          ),
        ),
      ],
    );
  }
}