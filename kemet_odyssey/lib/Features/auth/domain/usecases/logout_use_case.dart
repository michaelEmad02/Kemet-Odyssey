import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/auth/domain/repositories/auth_repo.dart';

class LogoutUseCase extends UseCase<Either<Failure,void>>{
  final AuthRepo authRepo;

  LogoutUseCase({required this.authRepo});
  @override
  Future<Either<Failure, void>> execute() {
    return authRepo.logout();
  }

}