import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/core/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/features/home/domain/usecases/fetch_place_details_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_place_details_event.dart';
part 'fetch_place_details_state.dart';

class FetchPlaceDetailsBloc
    extends Bloc<FetchPlaceDetailsEvent, FetchPlaceDetailsState> {
  final FetchPlaceDetailsUseCase fetchPlaceDetailsUseCase;
  FetchPlaceDetailsBloc(this.fetchPlaceDetailsUseCase)
      : super(FetchPlaceDetailsInitial()) {
    on<FetchPlaceDetailsEvent>((event, emit) async {
      emit(FetchPlaceDetailsLoading());
      final result =
          await fetchPlaceDetailsUseCase.execute(param: event.placeId);
      result.fold(
          (error) =>
              emit(FetchPlaceDetailsFailure(errorMessage: error.message)),
          (place) => emit(FetchPlaceDetailsLoaded(place: place)));
    });
  }
}
