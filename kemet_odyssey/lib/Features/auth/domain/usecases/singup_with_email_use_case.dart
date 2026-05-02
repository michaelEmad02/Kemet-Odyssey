import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_3param.dart';
import 'package:kemet_odyssey/features/auth/domain/repositories/auth_repo.dart';

class SingupWithEmailUseCase extends UseCase<Either<Failure, void>, String> {
  final AuthRepo authRepo;

  SingupWithEmailUseCase({required this.authRepo});

  @override
  Future<Either<Failure, void>> execute(
      [String param1 = "", String param2 = "", String param3 = ""]) {
    return authRepo.signUpWithEmail(
        name: param1, email: param2, password: param3);
  }
}
