import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  var isLodaing = false;

  void toVerifyPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/verifylogin');
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailLogin = Container(
      padding: const EdgeInsets.only(left: 5, right: 0, bottom: 4),
      height: 46,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).accentColor.withOpacity(0.5),
        border: Border.all(color: Colors.white),
      ),
      child: TextFormField(
        cursorColor: Colors.white,
        controller: emailController,
        onSaved: (value) {
          emailController.text = value!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please enter a valid email");
          }
          return null;
        },
        decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: 'Email...',
            prefixIcon: Icon(Icons.email)
            // suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
            ),
      ),
    );

    final passwordFill = Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      height: 46,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.5)),
      child: TextFormField(
        obscureText: true,
        cursorColor: Colors.white,
        controller: passwordController,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Please password is required");
          }

          if (!regex.hasMatch(value)) {
            return ("Enter a valid password(Min. 6 characters)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: 'Password...',
          prefixIcon: Icon(Icons.vpn_key),
        ),
      ),
    );

    final button = ElevatedButton(
      onPressed: () {
        signIn(
          passwordController.text,
          emailController.text,
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromRGBO(203, 160, 68, 1),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.fromLTRB(20, 0, 20, 0),
        ),
      ),
      child: const Text(
        'Sign In',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );

    return Scaffold(
      body: isLodaing == true
          ? CircleAvatar()
          : Stack(
              children: [
                Image.asset(
                  'assets/images/background/Component.jpg',
                  fit: BoxFit.cover,
                  height: double.maxFinite,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.7)),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logoInferno.png',
                        scale: 1.2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 280,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .backgroundColor
                              .withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        emailLogin,
                                        SizedBox(
                                          height: 25.w,
                                        ),
                                        passwordFill,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              button,
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => SignUpScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(203, 160, 68, 1)),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }

// login in function
  Future<void> signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => {
                isLodaing = true,
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/homepage', (route) => false)
              })
          .catchError((e) {
        return Future.error(e).toString();
      });
    }
  }
}
