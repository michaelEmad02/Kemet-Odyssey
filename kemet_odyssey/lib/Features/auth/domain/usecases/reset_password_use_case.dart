import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_1param.dart';
import 'package:kemet_odyssey/features/auth/domain/repositories/auth_repo.dart';

class ResetPasswordUseCase extends UseCase<Either<Failure,void>,String>{
  final AuthRepo authRepo;

  ResetPasswordUseCase({required this.authRepo});
  
  @override
  Future<Either<Failure, void>> execute({String param = ""}) {
    return authRepo.resetPassword(param);
  }
}