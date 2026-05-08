import 'package:firebase_core/firebase_core.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';

class FirebaseFailure extends Failure {
  const FirebaseFailure(super.message);

  factory FirebaseFailure.fromFirebaseException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return const FirebaseFailure(
            'You do not have permission to perform this operation.');
      case 'not-found':
        return const FirebaseFailure('The requested document was not found.');
      case 'unavailable':
        return const FirebaseFailure(
            'The service is currently unavailable. Please try again later.');
      case 'deadline-exceeded':
        return const FirebaseFailure(
            'The operation took too long. Please check your connection.');
      case 'already-exists':
        return const FirebaseFailure('The document already exists.');
      case 'resource-exhausted':
        return const FirebaseFailure(
            'Quota has been exceeded. Please try again later.');
      case 'failed-precondition':
        return const FirebaseFailure(
            'Operation failed due to a precondition. Please try again.');
      case 'aborted':
        return const FirebaseFailure(
            'The operation was aborted. Please try again.');
      case 'out-of-range':
        return const FirebaseFailure('Operation out of range.');
      case 'unimplemented':
        return const FirebaseFailure('This operation is not implemented.');
      case 'internal':
        return const FirebaseFailure(
            'Internal error occurred. Please try again.');
      case 'data-loss':
        return const FirebaseFailure('Unrecoverable data loss occurred.');
      case 'unauthenticated':
        return const FirebaseFailure(
            'You are not authenticated. Please log in again.');
      default:
        return FirebaseFailure(
            e.message ?? 'A Firebase error occurred. Please try again.');
    }
  }

  factory FirebaseFailure.fromException(Object e) {
    if (e is FirebaseException) {
      return FirebaseFailure.fromFirebaseException(e);
    }
    return const FirebaseFailure('An unexpected error occurred.');
  }
}
