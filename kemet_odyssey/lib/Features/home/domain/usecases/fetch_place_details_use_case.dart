import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_1param.dart';
import 'package:kemet_odyssey/features/home/domain/repositories/home_repo.dart';

class FetchPlaceDetailsUseCase
    extends UseCase<Either<Failure, PlaceEntity>, int> {
  final HomeRepo homeRepo;

  FetchPlaceDetailsUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, PlaceEntity>> execute({int param = 1}) {
    return homeRepo.fetchPlaceDetials(placeId: param);
  }
}
