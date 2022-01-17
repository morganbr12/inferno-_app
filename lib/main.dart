
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inferno/screens/welocme_screen.dart';





import './screens/Login_screen.dart';
import './screens/verify_login.dart';
import './screens/verify_signup.dart';
import './screens/code_verify.dart';
import './screens/home_screen.dart';
import './Widget/view_food.dart';
import './screens/view_all_screen.dart';
import './screens/Profile_screen.dart';
import './screens/profile_settings_page.dart';


void main() {
  runApp(const InfernoApp());
}

class InfernoApp extends StatelessWidget {
  const InfernoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(203, 160, 68, 1),
          accentColor: Colors.white,
          splashColor: Colors.grey.shade300,
          backgroundColor: const Color.fromRGBO(22, 22, 34, 1),

          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.white
            ),
            headline5: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              // color: Colors.white
            ),
            headline4: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w500,
                color: Colors.white
            ),
            headline3: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                // color: Colors.white
            ),
            headline2: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
            headline1: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          ),

          appBarTheme: AppBarTheme.of(context).copyWith(
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.black
            )
          )
        ),
        initialRoute: '/welcome',
        routes: {
          '/welcome': (ctx) => const WelcomeScreen(),
          '/login': (ctx) => const LoginScreen(),
          '/verifylogin': (ctx) => const VerifyLogin(),
          '/verifysignup': (ctx) => const VerifySignUp(),
          '/codeverify': (ctx) => const CodeVerification(),
          '/homepage': (ctx) => InfernoHomePage(),
          '/viewfood': (ctx) => ViewFood(),
          '/viewall': (ctx) => ViewAllFood(),
          '/profile': (ctx) => ProfileScreen(),
          '/profilesettings': (ctx) => ProfileSettingsPage(),
        },
      ),
      designSize: const Size(390, 844),
    );
  }
}
