import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/home/domain/entities/plan_entity.dart';
import 'package:kemet_odyssey/features/home/domain/repositories/home_repo.dart';

class FetchTopPlanUseCase extends UseCase<Either<Failure, List<PlanEntity>>> {
  final HomeRepo homeRepo;

  FetchTopPlanUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<PlanEntity>>> execute() {
    return homeRepo.fetchTopPlans();
  }
}
