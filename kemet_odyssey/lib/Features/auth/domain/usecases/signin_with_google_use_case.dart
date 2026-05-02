import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/auth/domain/repositories/auth_repo.dart';

class SigninWithGoogleUseCase extends UseCase<Either<Failure,void>> {
  final AuthRepo authRepo;

  SigninWithGoogleUseCase({required this.authRepo}); // for dependancy injection principle
  @override
  Future<Either<Failure, void>> execute() {
    return authRepo.signInWithGoogle();
  }

}