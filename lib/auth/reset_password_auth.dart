import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  static const routeName = 'resetPassword';
  String? email;

  final passwordReset = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final textField = Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: passwordReset,
        onSaved: (email) {
          setState(() {
            passwordReset.text = email!;
          });
        },
        validator: (email) {
          // if()
        },
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Enter your email',
        ),
      ),
    );

    final submitButton = ElevatedButton(
      onPressed: () {
        try {
          _auth.sendPasswordResetEmail(email: email!);
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => SizedBox(
                    child: AlertDialog(
                      // title: const Text(''),
                      insetPadding: EdgeInsets.symmetric(
                        // horizontal: 80.h,
                        vertical: 20.h,
                      ),
                      content: Text(
                        'An email has been sent to $email',
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamedAndRemoveUntil(
                                  '/login', (route) => false),
                          child: const Center(
                            child: Text('Ok'),
                          ),
                        ),
                      ],
                    ),
                  ));
        } catch (e) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Center(child: Text('Enter your email..')),
                    // content: Text('${e.toString()}'),
                    actions: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Center(child: Text('Ok')),
                      )
                    ],
                  ));
          // e.toString();
        }
      },
      child: const Text(
        'Reset',
        style: TextStyle(fontSize: 16),
      ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).primaryColor,
          )),
    );
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Forgotten Password",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Reset?',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 20, left: 20),
              child: textField,
            ),
            const SizedBox(
              height: 20,
            ),
            submitButton
          ],
        ),
      ),
    );
  }
}
