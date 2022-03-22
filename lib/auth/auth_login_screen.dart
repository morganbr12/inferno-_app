import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isLodaing = false;

  void toVerifyPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/verifylogin');
  }

  // final emailController = TextEditingController();

  // final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final emailLogin = Container(
      padding: const EdgeInsets.only(left: 5, right: 0, bottom: 4),
      height: 46,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.9),
        // border: Border.all(color: Colors.white),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        // controller: emailController,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          email = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter email';
          }
          if (!RegExp(r'^[a-zA-Z0+_.-1-9]+@[a-zA-Z0.-]+.[a-z]')
              .hasMatch(value)) {
            return "Enter a valid email";
          } else {
            return null;
          }
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
        // border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.9),
      ),
      child: TextFormField(
        obscureText: true,
        cursorColor: Colors.black,
        // controller: passwordController,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Please password is required");
          }

          if (!regex.hasMatch(value)) {
            return ("Enter a valid password(Min. 6 characters)");
          }
        },
        onChanged: (value) {
          password = value;
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
          email,
          password,
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
      body: Stack(
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
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
          ),
          Center(
            child: SingleChildScrollView(
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          isLodaing
                              ? CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                )
                              : button,
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
                                      builder: (_) => const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Color.fromRGBO(203, 160, 68, 1)),
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
            ),
          )
        ],
      ),
    );
  }

// login in function
  signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLodaing = true;
      });

      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        await Navigator.of(context)
            .pushNamedAndRemoveUntil('/homepage', (route) => false);
        setState(() {
          isLodaing = false;
        });
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Ops! Login Failed"),
            content: Text('${e.message}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        );
        print(e.message);
      }
      setState(() {
        isLodaing = false;
      });
    }
  }
}
