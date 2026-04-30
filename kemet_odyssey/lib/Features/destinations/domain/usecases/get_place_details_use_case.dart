import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_1param.dart';
import 'package:kemet_odyssey/features/destinations/data/models/place_model.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/features/destinations/domain/repositories/destinations_repo.dart';

class GetPlaceDetailsUseCase extends UseCase<Either<Failure, PlaceEntity>,int>{
  final DestinationsRepo destinationsRepo;

  GetPlaceDetailsUseCase({required this.destinationsRepo});
  
  @override
  Future<Either<Failure, PlaceModel>> execute({int param = 1}) {
    return destinationsRepo.getPlaceDetials(id: param);
  }


}