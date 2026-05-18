import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/planning/domain/entities/plan_entity.dart';
import 'package:kemet_odyssey/features/profile/domain/repositories/profile_repo.dart';

class FetchFavoritePlansUseCase
    extends UseCase<Either<Failure, List<PlanEntity>>> {
  final ProfileRepo profileRepo;

  FetchFavoritePlansUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, List<PlanEntity>>> execute() {
    return profileRepo.fetchFavoritePlans();
  }
}
