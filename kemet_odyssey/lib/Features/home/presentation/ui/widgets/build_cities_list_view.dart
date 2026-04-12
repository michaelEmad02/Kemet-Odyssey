import 'package:flutter/material.dart';
import 'package:kemet_odyssey/features/home/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/city_card.dart';

class BuildCitiesListView extends StatelessWidget {
  const BuildCitiesListView({
    super.key,
    required List<CityEntity> cities,
  }) : _cities = cities;

  final List<CityEntity> _cities;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          .40, // Responsive height can be adjusted here
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio:  2.8 / 2,
            mainAxisSpacing: 15,
            ),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        itemCount: _cities.length,
        itemBuilder: (context, index) {
          return CityCard(city: _cities[index]);
        },
      ),
    );
  }
}
