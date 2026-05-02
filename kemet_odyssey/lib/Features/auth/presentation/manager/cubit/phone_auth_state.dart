part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}
final class PhoneAuthLoading extends PhoneAuthState {}

final class PhoneCodeSent extends PhoneAuthState {
  final String verificationId;

  PhoneCodeSent({required this.verificationId});
}

final class PhoneAuthSuccess extends PhoneAuthState {}

final class PhoneAuthFailure extends PhoneAuthState {
  final String errorMessage;

  PhoneAuthFailure({required this.errorMessage});
}
