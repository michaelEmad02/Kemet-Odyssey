import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/core/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/features/home/domain/entities/plan_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CityEntity>>> fetchTopCities();
  Future<Either<Failure, List<PlaceEntity>>> fetchTopPlaces();
  Future<Either<Failure, PlaceEntity>> fetchPlaceDetials(
      {required int placeId});

  Future<Either<Failure, List<PlanEntity>>> fetchTopPlans();
}
