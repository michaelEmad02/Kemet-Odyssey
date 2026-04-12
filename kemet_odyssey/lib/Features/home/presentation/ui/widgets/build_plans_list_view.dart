import 'package:flutter/material.dart';
import 'package:kemet_odyssey/features/home/domain/entities/plan_entity.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/plan_card.dart';

class BuildPlansListView extends StatelessWidget {
  const BuildPlansListView({
    super.key,
    required List<PlanEntity> plans,
  }) : _plans = plans;

  final List<PlanEntity> _plans;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          .37, // Responsive height can be adjusted here
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio:  1.9 / 2,
            mainAxisSpacing: 15,
            ),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        itemCount: _plans.length,
        itemBuilder: (context, index) {
          return PlanCard(plan: _plans[index]);
        },
      ),
    );
  }
}
