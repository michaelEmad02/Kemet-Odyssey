import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/home/domain/repositories/home_repo.dart';

class FetchTopCitiesUseCase extends UseCase<Either<Failure, List<CityEntity>>> {
  final HomeRepo homeRepo;

  FetchTopCitiesUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<CityEntity>>> execute() {
    return homeRepo.fetchTopCities();
  }
}
