import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/profile/domain/repositories/profile_repo.dart';

class FetchFavoritePlacesUseCase
    extends UseCase<Either<Failure, List<PlaceEntity>>> {
  final ProfileRepo profileRepo;

  FetchFavoritePlacesUseCase({required this.profileRepo});
  @override
  Future<Either<Failure, List<PlaceEntity>>> execute() {
    return profileRepo.fetchFavoritePlaces();
  }
}
