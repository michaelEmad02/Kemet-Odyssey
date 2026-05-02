import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> checkAuthState();
  Either<Failure, User?> getCurrentUser();
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