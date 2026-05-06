import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/home/domain/repositories/home_repo.dart';

class FetchTopPalcesUseCase
    extends UseCase<Either<Failure, List<PlaceEntity>>> {
  final HomeRepo homeRepo;

  FetchTopPalcesUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<PlaceEntity>>> execute() {
    return homeRepo.fetchTopPlaces();
  }
}
