import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_1param.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/features/destinations/domain/repositories/destinations_repo.dart';

class GetPlacesUseCase extends UseCase<Either<Failure, List<PlaceEntity>>, String> {
  final DestinationsRepo destinationsRepo;

  GetPlacesUseCase({required this.destinationsRepo});

  @override
  Future<Either<Failure, List<PlaceEntity>>> execute({String? param}) {
    // implement execute
    return destinationsRepo.getPlaces(cityName: param!);
  }
}

