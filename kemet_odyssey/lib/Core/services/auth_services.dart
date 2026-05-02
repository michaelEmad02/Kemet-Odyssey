abstract class AuthServices {
  bool checkAuthState();
  bool emailVerfied();
  dynamic getCurrentUser();
  Future<void> logout();

  Future<dynamic> signUpWithEmail(
      {required String name, required String email, required String password});
  Future<dynamic> signInWithEmail(
      {required String email, required String password});
  Future<dynamic> signInWithGoogle();
  Future<dynamic> signInWithPhone(
      {required String verificationID, required String smsCode});
  Future<String> verifyPhoneNumber(String phone);
  Future<void> verifyEmail();
  Future<void> resetPassword(String emailAddress);
}
