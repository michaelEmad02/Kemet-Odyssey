import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/widgets/profile/build_action_item.dart';

class BuildActionsList extends StatelessWidget {
  const BuildActionsList({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          BuildActionItem(
              theme: theme,
              icon: Icons.book_outlined,
              text: 'My Plans',
              isDestructive: false,
              onTap: () => context.pushNamed('my_plans')),
          Divider(
              height: 1,
              color: theme.colorScheme.outlineVariant.withOpacity(0.2)),
          BuildActionItem(
              theme: theme,
              icon: Icons.confirmation_number,
              text: 'My Bookings',
              isDestructive: false,
              onTap: () {}),
          Divider(
              height: 1,
              color: theme.colorScheme.outlineVariant.withOpacity(0.2)),
          BuildActionItem(
              theme: theme,
              icon: Icons.settings,
              text: 'Settings',
              isDestructive: false,
              onTap: () {}),
          Divider(
              height: 1,
              color: theme.colorScheme.outlineVariant.withOpacity(0.2)),
          BuildActionItem(
              theme: theme,
              icon: Icons.logout,
              text: 'Logout',
              isDestructive: true,
              onTap: () {}),
        ],
      ),
    );
  }
}
