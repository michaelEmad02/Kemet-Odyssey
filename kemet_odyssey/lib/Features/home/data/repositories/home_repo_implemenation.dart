import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/core/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/errors/firebase_failures.dart';
import 'package:kemet_odyssey/core/errors/server_failure.dart';
import 'package:kemet_odyssey/features/home/data/datasources/home_local_data_source.dart';
import 'package:kemet_odyssey/features/home/data/datasources/home_remote_data_source.dart';
import 'package:kemet_odyssey/features/planning/domain/entities/plan_entity.dart';
import 'package:kemet_odyssey/features/home/domain/repositories/home_repo.dart';

class HomeRepoImplemenation extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImplemenation(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, PlaceEntity>> fetchPlaceDetials(
      {required int placeId}) async {
    try {
      final place =
          await homeLocalDataSource.fetchPlacedetails(placeId: placeId);
      return Right(place);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CityEntity>>> fetchTopCities() async {
    try {
      final cities = await homeLocalDataSource.fetchTopCities();
      return Right(cities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PlaceEntity>>> fetchTopPlaces() async {
    try {
      final places = await homeLocalDataSource.fetchTopPlaces();
      return Right(places);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PlanEntity>>> fetchTopPlans() async {
    try {
      final plans = await homeRemoteDataSource.fetchTopPlans();
      return Right(plans);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }
}
