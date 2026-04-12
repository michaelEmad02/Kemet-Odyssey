import 'package:flutter/material.dart';
import 'package:kemet_odyssey/features/home/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/place_card.dart';

class BuildPlacesListView extends StatelessWidget {
  const BuildPlacesListView({
    super.key,
    required List<PlaceEntity> places,
  }) : _places = places;

  final List<PlaceEntity> _places;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          .40, // Responsive height can be adjusted here
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio:  3 / 2,
            mainAxisSpacing: 15,
            ),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        itemCount: _places.length,
        itemBuilder: (context, index) {
          return PlaceCard(place: _places[index]);
        },
      ),
    );
  }
}
