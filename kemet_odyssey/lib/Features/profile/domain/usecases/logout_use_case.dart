import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/profile/domain/repositories/profile_repo.dart';

// will move this file into profile feature
class LogoutUseCase extends UseCase<Either<Failure, void>> {
  final ProfileRepo profileRepo;

  LogoutUseCase({required this.profileRepo});
  @override
  Future<Either<Failure, void>> execute() {
    return profileRepo.logout();
  }
}
