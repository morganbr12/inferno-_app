import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void toVerifyPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/verifylogin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background/Component.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
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
                  height: 20,
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
                  height: 70.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 5, right: 0, bottom: 4),
                      height: 46,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).accentColor.withOpacity(0.5),
                        border: Border.all(color: Colors.white),
                      ),
                      child: const TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: '+233',
                          // suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      height: 46,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5)),
                      child: const TextField(
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintText: 'Phone number'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  onPressed: () => toVerifyPage(context),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(203, 160, 68, 1),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      )),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
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
                        style:
                            TextStyle(color: Color.fromRGBO(203, 160, 68, 1)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
