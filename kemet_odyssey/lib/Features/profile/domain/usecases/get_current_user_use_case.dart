import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/auth/data/models/user_model.dart';
import 'package:kemet_odyssey/features/profile/domain/repositories/profile_repo.dart';

class GetCurrentUserUseCase extends UseCase<Either<Failure, UserModel?>> {
  final ProfileRepo profileRepo;

  GetCurrentUserUseCase({required this.profileRepo});
  @override
  Future<Either<Failure, UserModel?>> execute() async {
    return profileRepo.getCurrentUser();
  }
}
