import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/fetch_destinations_data_cubit.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/explore_cities/build_city_card.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/explore_cities/city_card_shimmer.dart';

class BuildCitiesList extends StatelessWidget {
  const BuildCitiesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDestinationsDataCubit, FetchDestinationsDataState>(
      builder: (context, state) {
        if (state is FetchDestinationsDataLoading) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverList.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                return CityCardShimmer(
                    height: MediaQuery.of(context).size.height * 0.45);
              },
            ),
          );
        } else if (state is FetchDestinationsDataError) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text(state.errorMessage)),
          );
        } else if (state is FetchDestinationsDataLoaded) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverList.separated(
              itemCount: state.cities.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final item = state.cities[index];
                final delay = (500 + (index * 100)).ms;
                return BuildCityCard(
                  item: item,
                  delay: delay,
                  height: MediaQuery.of(context).size.height * 0.45,
                );
              },
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
