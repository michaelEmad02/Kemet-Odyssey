part of 'fetch_destinations_data_cubit.dart';

@immutable
sealed class FetchDestinationsDataState {}

final class FetchDestinationsDataInitial extends FetchDestinationsDataState {}

final class FetchDestinationsDataLoading extends FetchDestinationsDataState {}

final class FetchDestinationsDataLoaded extends FetchDestinationsDataState {
  final List<CityEntity> cities;
  FetchDestinationsDataLoaded(this.cities);
}

final class FetchDestinationsDataError extends FetchDestinationsDataState {
  final String errorMessage;
  FetchDestinationsDataError(this.errorMessage);
}
