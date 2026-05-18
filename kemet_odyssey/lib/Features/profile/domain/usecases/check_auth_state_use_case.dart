// will move this file into profile feature
import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/profile/domain/repositories/profile_repo.dart';

class CheckAuthStateUseCase extends UseCase<Either<Failure, bool>> {
  final ProfileRepo profileRepo;

  CheckAuthStateUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, bool>> execute() {
    return profileRepo.checkAuthState();
  }
}
