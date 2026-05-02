import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/use_cases.dart/use_case_no_param.dart';
import 'package:kemet_odyssey/features/auth/data/models/user_model.dart';
import 'package:kemet_odyssey/features/auth/domain/repositories/auth_repo.dart';

class GetCurrentUserUseCase extends UseCase<Either<Failure,UserModel?>>{
  final AuthRepo authRepo;

  GetCurrentUserUseCase({required this.authRepo});
  @override
  Future<Either<Failure, UserModel?>> execute() async {
   return authRepo.getCurrentUser();
  }
}