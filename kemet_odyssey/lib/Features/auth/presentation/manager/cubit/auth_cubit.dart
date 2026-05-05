import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/signin_with_email_use_case.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/signin_with_google_use_case.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/singup_with_email_use_case.dart';
import 'package:kemet_odyssey/features/auth/domain/usecases/verify_email_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      this.signinWithEmailUseCase,
      this.singupWithEmailUseCase,
      this.signinWithGoogleUseCase,
      this.verifyEmailUseCase,
      this.resetPasswordUseCase)
      : super(AuthInitial());

  final SigninWithEmailUseCase signinWithEmailUseCase;
  final SingupWithEmailUseCase singupWithEmailUseCase;
  final SigninWithGoogleUseCase signinWithGoogleUseCase;
  final VerifyEmailUseCase verifyEmailUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  Future<void> signinWithEmail(
      {required String email, required String password}) async {
    emit(AuthLoading());
    var result = await signinWithEmailUseCase.execute(email, password);
    result.fold(
      (error) => emit(AuthFailure(errorMessage: error.message)),
      (user) => emit(AuthSuccess()),
    );
  }

  Future<void> signupWithEmail(
      {required name, required String email, required String password}) async {
    emit(AuthLoading());
    var result = await singupWithEmailUseCase.execute(name, email, password);
    result.fold(
      (error) => emit(AuthFailure(errorMessage: error.message)),
      (user) => emit(AuthSuccess()),
    );
  }

  Future<void> signinWithGoogle() async {
    emit(AuthLoading());
    var result = await signinWithGoogleUseCase.execute();
    result.fold(
      (error) => emit(AuthFailure(errorMessage: error.message)),
      (user) => emit(AuthSuccess()),
    );
  }

  Future<void> verifyEmail() async {
    emit(AuthLoading());
    var result = await verifyEmailUseCase.execute();
    result.fold(
      (error) => emit(AuthFailure(errorMessage: error.message)),
      (user) => emit(AuthSuccess()),
    );
  }

  Future<void> resetPasword({required String emailAddress}) async {
    emit(AuthLoading());
    var result = await resetPasswordUseCase.execute(param: emailAddress);
    result.fold(
      (error) => emit(AuthFailure(errorMessage: error.message)),
      (user) => emit(PasswordResetSuccess()),
    );
  }
}
