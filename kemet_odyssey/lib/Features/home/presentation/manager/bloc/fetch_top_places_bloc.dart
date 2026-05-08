import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/core/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/features/home/domain/usecases/fetch_top_palces_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_top_places_event.dart';
part 'fetch_top_places_state.dart';

class FetchTopPlacesBloc
    extends Bloc<FetchTopPlacesEvent, FetchTopPlacesState> {
  final FetchTopPalcesUseCase fetchTopPalcesUseCase;
  FetchTopPlacesBloc(this.fetchTopPalcesUseCase)
      : super(FetchTopPlacesInitial()) {
    on<FetchTopPlacesEvent>((event, emit) async {
      emit(FetchTopPlacesLoading());
      var result = await fetchTopPalcesUseCase.execute();
      result.fold(
          (error) => emit(FetchTopPlacesFailure(errorMessage: error.message)),
          (places) => emit(FetchTopPlacesLoaded(topPlaces: places)));
    });
  }
}
