import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_2param.dart';
import 'package:kemet_odyssey/features/auth/domain/repositories/auth_repo.dart';

class SigninWithPhoneUseCase extends UseCase<Either<Failure, void>, String> {
  final AuthRepo authRepo;

  SigninWithPhoneUseCase({required this.authRepo});
  @override
  Future<Either<Failure, void>> execute(
      [String param1 = "", String param2 = ""]) {
    return authRepo.signInWithPhone(verificationID: param1, smsCode: param2);
  }
}
