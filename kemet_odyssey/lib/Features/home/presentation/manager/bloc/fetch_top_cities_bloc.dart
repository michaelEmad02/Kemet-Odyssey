import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/core/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/features/home/domain/usecases/fetch_top_cities_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_top_cities_event.dart';
part 'fetch_top_cities_state.dart';

class FetchTopCitiesBloc
    extends Bloc<FetchTopCitiesEvent, FetchTopCitiesState> {
  final FetchTopCitiesUseCase fetchTopCitiesUseCase;
  FetchTopCitiesBloc(this.fetchTopCitiesUseCase)
      : super(FetchTopCitiesInitial()) {
    on<FetchTopCities>((event, emit) async {
      emit(FetchTopCitiesLoading());
      var result = await fetchTopCitiesUseCase.execute();
      result.fold(
          (error) => emit(FetchTopCitiesFailure(errorMessage: error.message)),
          (cities) => emit(FetchTopCitiesLoaded(topCities: cities)));
    });
  }
}
