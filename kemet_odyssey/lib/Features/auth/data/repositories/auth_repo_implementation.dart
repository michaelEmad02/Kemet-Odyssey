import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:kemet_odyssey/features/auth/data/models/user_model.dart';
import 'package:kemet_odyssey/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImplementation({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, bool>> checkAuthState() {
    return authRemoteDataSource.checkAuthState();
  }

  @override
  Future<Either<Failure, bool>> emailVerfied() {
    return authRemoteDataSource.emailVerfied();
  }

  @override
  Either<Failure, UserModel?> getCurrentUser() {
    return authRemoteDataSource.getCurrentUser();
  }

  @override
  Future<Either<Failure, void>> logout() {
    return authRemoteDataSource.logout();
  }

  @override
  Future<Either<Failure, void>> resetPassword(String emailAddress) {
    return authRemoteDataSource.resetPassword(emailAddress);
  }

  @override
  Future<Either<Failure, void>> signInWithEmail(
      {required String email, required String password}) {
    return authRemoteDataSource.signInWithEmail(
        email: email, password: password);
  }

  @override
  Future<Either<Failure, void>> signInWithGoogle() {
    return authRemoteDataSource.signInWithGoogle();
  }

  @override
  Future<Either<Failure, void>> signInWithPhone(
      {required String verificationID, required String smsCode}) {
    return authRemoteDataSource.signInWithPhone(
        verificationID: verificationID, smsCode: smsCode);
  }

  @override
  Future<Either<Failure, void>> signUpWithEmail(
      {required String name, required String email, required String password}) {
    return authRemoteDataSource.signInWithEmail(
        email: email, password: password);
  }

  @override
  Future<Either<Failure, void>> verifyEmail() {
    return authRemoteDataSource.verifyEmail();
  }

  @override
  Future<Either<Failure, String>> verifyPhoneNumber(String phone) {
    return verifyPhoneNumber(phone);
  }
}
