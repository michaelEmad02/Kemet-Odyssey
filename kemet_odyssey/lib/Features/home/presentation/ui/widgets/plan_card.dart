import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/features/home/domain/entities/plan_entity.dart';

class PlanCard extends StatelessWidget {
  final PlanEntity plan;

  const PlanCard({
    super.key,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        context.pushNamed('plan_details', pathParameters: {'planId': plan.id});
      },
      child: Container(
        // width: width,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.surfaceContainerHigh,
              theme.colorScheme.surface,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: theme.colorScheme.primary.withOpacity(0.1)),
        ),
        child: BuildCardBody(theme: theme, plan: plan),
      ),
    )
        .animate()
        .fadeIn(delay: const Duration(milliseconds: 800))
        .slideX(begin: 0.1, end: 0);
  }
}

class BuildCardBody extends StatelessWidget {
  const BuildCardBody({
    super.key,
    required this.theme,
    required this.plan,
  });

  final ThemeData theme;
  final PlanEntity plan;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildCardHeader(theme: theme, plan: plan),
        const SizedBox(height: 24),
        Text(
          plan.city,
          style: theme.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        BuildPlanCategoriesList(plan: plan, theme: theme),
        const SizedBox(height: 20),
        BuildDiscoverPlanButton(plan: plan),
      ],
    );
  }
}

class BuildCardHeader extends StatelessWidget {
  const BuildCardHeader({
    super.key,
    required this.theme,
    required this.plan,
  });

  final ThemeData theme;
  final PlanEntity plan;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 110,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_border_outlined,
                color: theme.colorScheme.primary,
                size: 22,
              ),
              const SizedBox(width: 5),
              Text(
                '${plan.averageRating.toString()} (${plan.ratingCount.toString()})',
                style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            plan.duration,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class BuildPlanCategoriesList extends StatelessWidget {
  const BuildPlanCategoriesList({
    super.key,
    required this.plan,
    required this.theme,
  });

  final PlanEntity plan;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .04,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: plan.categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    plan.categories[index],
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class BuildDiscoverPlanButton extends StatelessWidget {
  const BuildDiscoverPlanButton({
    super.key,
    required this.plan,
  });

  final PlanEntity plan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context
              .pushNamed('plan_details', pathParameters: {'planId': plan.id});
        },
        child: const Text('DISCOVER PLAN',
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
      ),
    );
  }
}
