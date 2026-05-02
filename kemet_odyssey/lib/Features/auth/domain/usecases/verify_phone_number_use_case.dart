import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_1param.dart';
import 'package:kemet_odyssey/features/auth/domain/repositories/auth_repo.dart';

class VerifyPhoneNumberUseCase extends UseCase<Either<Failure,String>,String>{
  final AuthRepo authRepo;

  VerifyPhoneNumberUseCase({required this.authRepo});
  
  @override
  Future<Either<Failure, String>> execute({String param= ""}) {
    return authRepo.verifyPhoneNumber(param);
  }
}