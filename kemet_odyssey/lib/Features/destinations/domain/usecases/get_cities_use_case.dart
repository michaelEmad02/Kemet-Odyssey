import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/features/destinations/domain/repositories/destinations_repo.dart';

class GetCitiesUseCase extends UseCase<List<CityEntity>> {
  final DestinationsRepo destinationsRepo;

  GetCitiesUseCase({required this.destinationsRepo});

  @override
  Future<List<CityEntity>> execute() {
    // implement execute
    return destinationsRepo.getCities();
  }
}
