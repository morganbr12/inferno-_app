import 'package:flutter/material.dart';

import 'auth_widget.dart/sign_up.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/images/background/Component.jpg',
            width: MediaQuery.of(context).size.width,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          SignUpPage()
        ],
      ),
    );
  }
}
