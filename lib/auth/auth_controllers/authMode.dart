import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:inferno/auth/otp_code_verify.dart';

class AuthMode {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, 'Verification Completed');
    };
    PhoneVerificationFailed verificationFailed = (FirebaseException exception) {
      showSnackBar(context, exception.toString());
    };
    PhoneCodeSent codeSent =
        (String CodeVerification, [forceResendingtoken]) {};
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      showSnackBar(context, 'Time Out');
    };
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  Future<void> singInWithPhoneNumber() async {
    try {} catch (error) {}
  }

  void showSnackBar(BuildContext ctx, String text) {
    final snackbar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
  }
}
