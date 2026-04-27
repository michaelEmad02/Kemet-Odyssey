import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/features/destinations/domain/usecases/get_cities_use_case.dart';

part 'fetch_destinations_data_state.dart';

class FetchDestinationsDataCubit extends Cubit<FetchDestinationsDataState> {
  final GetCitiesUseCase getCitiesUseCase;
  FetchDestinationsDataCubit(this.getCitiesUseCase)
      : super(FetchDestinationsDataInitial());

  Future<void> fetchCitiesData() async {
    emit(FetchDestinationsDataLoading());
    final result = await getCitiesUseCase.execute();
    result.fold((failure) => emit(FetchDestinationsDataError(failure.message)),
        (cities) => emit(FetchDestinationsDataLoaded(cities)));
  }
}
