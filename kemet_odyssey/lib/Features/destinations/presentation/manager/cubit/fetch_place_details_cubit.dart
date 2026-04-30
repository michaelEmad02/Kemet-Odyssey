import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/destinations/data/models/place_model.dart';
import 'package:kemet_odyssey/features/destinations/domain/usecases/get_place_details_use_case.dart';

part 'fetch_place_details_state.dart';

class FetchPlaceDetailsCubit extends Cubit<FetchPlaceDetailsState> {
  final GetPlaceDetailsUseCase getPlaceDetailsUseCase;
  FetchPlaceDetailsCubit(this.getPlaceDetailsUseCase)
      : super(FetchPlaceDetailsInitial());

  Future<void> fetchPlaceDetails({required int id}) async {
    emit(FetchPlaceDetailsLoading());
    final result = await getPlaceDetailsUseCase.execute(param: id);
    result.fold(
        (failure) =>
            emit(FetchPlaceDetailsFailure(errorMessage: failure.message)),
        (place) => emit(FetchPlaceDetailsLoaded(place: place)));
  }
}
