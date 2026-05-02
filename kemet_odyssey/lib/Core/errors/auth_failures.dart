import 'package:firebase_auth/firebase_auth.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';

class AuthFailure extends Failure {
  const AuthFailure(super.message);

  factory AuthFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const AuthFailure('The email address is invalid.');
      case 'user-disabled':
        return const AuthFailure('This user account has been disabled.');
      case 'user-not-found':
        return const AuthFailure('No user found with this email.');
      case 'wrong-password':
      case 'invalid-credential':
        return const AuthFailure('Invalid email or password.');
      case 'email-already-in-use':
        return const AuthFailure('This email is already in use.');
      case 'operation-not-allowed':
        return const AuthFailure('This sign in method is not enabled.');
      case 'weak-password':
        return const AuthFailure('Password is too weak.');
      case 'network-request-failed':
        return const AuthFailure('Network error. Please check your connection.');
      case 'too-many-requests':
        return const AuthFailure(
          'Too many requests. Please try again later.',
        );
      case 'account-exists-with-different-credential':
        return const AuthFailure(
          'An account already exists with a different sign-in provider.',
        );
      case 'credential-already-in-use':
        return const AuthFailure(
          'This credential is already associated with another account.',
        );
      case 'invalid-verification-code':
        return const AuthFailure('The SMS verification code is invalid.');
      case 'invalid-verification-id':
        return const AuthFailure('The verification session has expired.');
      case 'requires-recent-login':
        return const AuthFailure(
          'Please re-authenticate and try again.',
        );
      default:
        return AuthFailure(
          e.message ?? 'Authentication failed. Please try again.',
        );
    }
  }

  factory AuthFailure.fromException(Object e) {
    if (e is FirebaseAuthException) {
      return AuthFailure.fromFirebaseAuthException(e);
    }
    return const AuthFailure('Unexpected authentication error occurred.');
  }
}
