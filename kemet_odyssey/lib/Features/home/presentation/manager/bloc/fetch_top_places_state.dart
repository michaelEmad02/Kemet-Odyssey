part of 'fetch_top_places_bloc.dart';

@immutable
sealed class FetchTopPlacesState {}

final class FetchTopPlacesInitial extends FetchTopPlacesState {}

final class FetchTopPlacesLoading extends FetchTopPlacesState {}

final class FetchTopPlacesLoaded extends FetchTopPlacesState {
  final List<PlaceEntity> topPlaces;

  FetchTopPlacesLoaded({required this.topPlaces});
}

final class FetchTopPlacesFailure extends FetchTopPlacesState {
  final String errorMessage;

  FetchTopPlacesFailure({required this.errorMessage});
}
