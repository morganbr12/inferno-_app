import 'package:flutter/material.dart';
// import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({Key? key}) : super(key: key);

  @override
  _CodeVerificationState createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(22, 22, 34, 1),
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Phone Verification',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Enter OTP code here',
              style: TextStyle(
                  fontSize: 13,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OTPTextField(
                    // controller: otpController,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 48,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.grey.withOpacity(0.8),
                      borderColor: Colors.grey.withOpacity(0.8),
                    ),
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15,
                    style: const TextStyle(fontSize: 17),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I didn\'t  receive code?',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend a new code',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(203, 160, 68, 1),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  )),
              child: const Text(
                'Verify',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
