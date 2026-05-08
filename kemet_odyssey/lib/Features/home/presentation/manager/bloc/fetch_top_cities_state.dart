part of 'fetch_top_cities_bloc.dart';

@immutable
sealed class FetchTopCitiesState {}

final class FetchTopCitiesInitial extends FetchTopCitiesState {}

final class FetchTopCitiesLoading extends FetchTopCitiesState {}

final class FetchTopCitiesLoaded extends FetchTopCitiesState {
  final List<CityEntity> topCities;

  FetchTopCitiesLoaded({required this.topCities});
}

final class FetchTopCitiesFailure extends FetchTopCitiesState {
  final String errorMessage;

  FetchTopCitiesFailure({required this.errorMessage});
}
