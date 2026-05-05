import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/features/destinations/data/datasources/destination_local_data_source.dart';
import 'package:kemet_odyssey/features/destinations/data/models/place_model.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/features/destinations/domain/repositories/destinations_repo.dart';

class DestinationsRepoImpl implements DestinationsRepo {
  final DestinationLocalDataSource localDataSource;

  DestinationsRepoImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<CityEntity>>> getCities() async {
    try {
      final cities = await localDataSource.fetchCities();
      return Right(cities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, List<PlaceEntity>>> getPlaces({required String cityName}) async {
    // return await remoteDataSource.fetchPlaces(cityName: cityName);
    return const Right([]); // Placeholder until fetchPlaces is implemented in datasource
  }
  
  @override
  Future<Either<Failure, PlaceEntity>> getPlaceDetials({required int id}) async {
     try {
      final place = await localDataSource.fetchPlacedetails(placeId: id);
      return Right(place);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
