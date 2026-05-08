part of 'fetch_place_details_bloc.dart';

@immutable
sealed class FetchPlaceDetailsEvent {
  final int placeId;

  const FetchPlaceDetailsEvent({required this.placeId});
}
