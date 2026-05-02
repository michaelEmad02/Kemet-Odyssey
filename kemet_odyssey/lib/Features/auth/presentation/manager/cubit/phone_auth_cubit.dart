import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/signin_with_phone_use_case.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/verify_phone_number_use_case.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit(
      {required this.signinWithPhoneUseCase,
      required this.verifyPhoneNumberUseCase})
      : super(PhoneAuthInitial());

  final SigninWithPhoneUseCase signinWithPhoneUseCase;
  final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase;

  Future<void> signinWithPhone(String phoneNumber) async {
    emit(PhoneAuthLoading());
    final result = await verifyPhoneNumberUseCase.execute(param: phoneNumber);
    result.fold(
      (error) => emit(PhoneAuthFailure(errorMessage: error.message)),
      (verificationId) => emit(PhoneCodeSent(verificationId: verificationId)),
    );
  }

  Future<void> confirmPhoneCode({
    required String verificationId,
    required String smsCode,
  }) async {
    emit(PhoneAuthLoading());
    final result = await signinWithPhoneUseCase.execute(
      verificationId,
      smsCode,
    );
    result.fold(
      (error) => emit(PhoneAuthFailure(errorMessage: error.message)),
      (_) => emit(PhoneAuthSuccess()),
    );
  }
}
