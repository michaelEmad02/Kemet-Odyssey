import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kemet_odyssey/core/services/auth_services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices implements AuthServices {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthServices({required this.firebaseAuth});
  @override
  bool checkAuthState() {
    return getCurrentUser() == null ? false : true;
  }

  @override
  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  @override
  Future<void> logout() async {
    if (checkAuthState()) {
      GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.disconnect();
      firebaseAuth.signOut();
    }
  }

  @override
  Future<void> resetPassword(String emailAddress) async {
    await firebaseAuth.sendPasswordResetEmail(email: emailAddress);
  }

  @override
  Future<UserCredential> signInWithEmail(
      {required String email, required String password}) async {
    return firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return null;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<UserCredential> signInWithPhone(
      {required String verificationID, required String smsCode}) async {
    var result = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: smsCode);
    return await firebaseAuth.signInWithCredential(result);
  }

  @override
  Future<UserCredential> signUpWithEmail(
      {required String name,
      required String email,
      required String password}) async {
    var userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await updateDisplayName(name);
    await verifyEmail();
    return userCredential;
  }

  Future<void> updateDisplayName(String name)async{   // to single Responsibility principle
    await getCurrentUser()!.updateDisplayName(name);
  }

  @override
  Future<void> verifyEmail() async {
    await getCurrentUser()!.sendEmailVerification();
  }

  @override
  Future<String> verifyPhoneNumber(String phone) async{
        String verificationID = "";
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (phoneAuthCredential) async {
        await firebaseAuth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        debugPrint(error.code);
      },
      codeSent: (verificationId, forceResendingToken) {
        verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
    return verificationID;
  }
  
  @override
  bool emailVerfied() {
    return getCurrentUser()!.emailVerified;
  }
}
