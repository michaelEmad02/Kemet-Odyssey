part of 'fetch_place_details_cubit.dart';

@immutable
sealed class FetchPlaceDetailsState {}

final class FetchPlaceDetailsInitial extends FetchPlaceDetailsState {}

final class FetchPlaceDetailsLoading extends FetchPlaceDetailsState {}

final class FetchPlaceDetailsLoaded extends FetchPlaceDetailsState {
  final PlaceModel place;

  FetchPlaceDetailsLoaded({required this.place});
}

final class FetchPlaceDetailsFailure extends FetchPlaceDetailsState {
  final String errorMessage;

  FetchPlaceDetailsFailure({required this.errorMessage});
}
