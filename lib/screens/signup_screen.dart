import 'package:flutter/material.dart';




import '../Widget/sign_up.dart';




class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Image.asset(
        'assets/images/background/Component.png',
        width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        // SignUpPage(),
        SignUpPage()
      ],
        ),
    );
  }
}
