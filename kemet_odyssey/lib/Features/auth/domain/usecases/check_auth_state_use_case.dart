import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/auth/domain/repositories/auth_repo.dart';


// will move this file into profile feature
class CheckAuthStateUseCase extends UseCase<Either<Failure,bool>>{
  final AuthRepo authRepo;

  CheckAuthStateUseCase({required this.authRepo});
  
  @override
  Future<Either<Failure, bool>> execute() {
    return authRepo.checkAuthState();
  }
}