import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/auth_failures.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/services/auth_services.dart';
import 'package:kemet_odyssey/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, bool>> checkAuthState();
  Future<Either<Failure, bool>> emailVerfied();
  Either<Failure, UserModel?> getCurrentUser();
  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> signUpWithEmail(
      {required String name, required String email, required String password});
  Future<Either<Failure, void>> signInWithEmail(
      {required String email, required String password});
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> signInWithPhone(
      {required String verificationID, required String smsCode});
  Future<Either<Failure, String>> verifyPhoneNumber(String phone);
  Future<Either<Failure, void>> verifyEmail();
  Future<Either<Failure, void>> resetPassword(String emailAddress);
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final AuthServices authServices;

  AuthRemoteDataSourceImplementation({required this.authServices});

  @override
  Future<Either<Failure, bool>> checkAuthState() async {
    try {
      final result = authServices.checkAuthState();
      return Right(result);
    } catch (e) {
      return Left(AuthFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> emailVerfied() async {
    try {
      final result = authServices.emailVerfied();
      return Right(result);
    } catch (e) {
      return Left(AuthFailure.fromException(e));
    }
  }

  @override
  Either<Failure, UserModel?> getCurrentUser() {
    try {
      final result = authServices.getCurrentUser();
      return Right(result);
    } catch (e) {
      return Left(AuthFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await authServices.logout();
      return Right(result);
    } catch (e) {
      return Left(AuthFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String emailAddress) async {
    try {
      final result = await authServices.resetPassword(emailAddress);
      return Right(result);
    } catch (e) {
      return Left(AuthFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await authServices.signInWithEmail(email: email, password: password);
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      await authServices.signInWithGoogle();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithPhone(
      {required String verificationID, required String smsCode}) async {
    try {
      await authServices.signInWithPhone(
          verificationID: verificationID, smsCode: smsCode);
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> signUpWithEmail(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await authServices.signInWithEmail(email: email, password: password);
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmail() async {
    try {
      await authServices.verifyEmail();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, String>> verifyPhoneNumber(String phone) async {
    try {
      return Right(await authServices.verifyPhoneNumber(phone));
    } catch (e) {
      return Left(AuthFailure.fromException(e));
    }
  }
}
