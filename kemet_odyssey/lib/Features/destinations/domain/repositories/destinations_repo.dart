import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/core/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';

abstract class DestinationsRepo {
  Future<Either<Failure, List<CityEntity>>> getCities();
  Future<Either<Failure, List<PlaceEntity>>> getPlaces(
      {required String cityName});
  Future<Either<Failure, PlaceEntity>> getPlaceDetials({required int id});
}
