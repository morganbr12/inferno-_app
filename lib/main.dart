import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inferno/auth/auth_controllers/controllers.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'firebase_options.dart';

import './screens/cart_screen.dart';
import './screens/cart_fill.dart';
import './screens/welocme_screen.dart';
import 'auth/auth_login_screen.dart';
import './auth/otp_code_verify.dart';
import './auth/otp_verify_login.dart';
// import './auth/signup_screen.dart';
import './auth/verify_signup.dart';
import './screens/home_screen.dart';
import './Widget/view_food.dart';
import './screens/view_all_screen.dart';
import './screens/Profile_screen.dart';
import './screens/profile_settings_page.dart';
import './screens/full_view_notification.dart';
// import './models/notificationList.dart';
import './screens/About_screen.dart';
import './screens/payment_screent.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(InfernoApp());
}

class InfernoApp extends StatelessWidget {
  const InfernoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
    return ScreenUtilInit(
      builder: () => MultiProvider(
        providers: [
          Provider<AuthenticationServices>(
            create: (_) => AuthenticationServices(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context) =>
                  context.read<AuthenticationServices>().authStateChanges,
              initialData: "/welcome")
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: const Color.fromRGBO(203, 160, 68, 1),
              accentColor: Colors.white,
              splashColor: Colors.grey.shade300,
              backgroundColor: const Color.fromRGBO(22, 22, 34, 1),
              fontFamily: 'Poppins',
              textTheme: ThemeData.light().textTheme.copyWith(
                    bodyText1: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.white),
                    headline5: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    headline4: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    headline3: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      // color: Colors.white
                    ),
                    headline2: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    headline1: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
              appBarTheme: AppBarTheme.of(context).copyWith(
                  titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.black))),
          initialRoute: '/welcome',
          routes: {
            '/welcome': (ctx) => const WelcomeScreen(),
            '/login': (ctx) => const LoginScreen(),
            '/verifylogin': (ctx) => const VerifyLogin(),
            '/verifysignup': (ctx) => VerifySignUp(),
            '/codeverify': (ctx) => const CodeVerification(),
            '/homepage': (ctx) => const InfernoHomePage(),
            '/viewfood': (ctx) => const ViewFood(),
            '/viewall': (ctx) => const ViewAllFood(),
            '/profile': (ctx) => const ProfileScreen(),
            '/profilesettings': (ctx) => const ProfileSettingsPage(),
            '/cart_fill': (ctx) => const CartFill(),
            '/viewfullnotification': (ctx) => const FullViewNotification(),
            '/about': (ctx) => const AboutScreen(),
            '/payment': (ctx) => const PaymentScreen(),
            '/tracking': (ctx) => const CartScreen()
          },
        ),
      ),
      designSize: const Size(390, 844),
    );
  }
}

// class AuthenticationWrapper extends StatelessWidget {
//   const AuthenticationWrapper({Key? key}) : super(key: key);

  
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();
//     if (firebaseUser != null) {
//       Navigator.of(context).pushNamedAndRemoveUntil("/homepage", (route) => false);
//     } else {
//       Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
//     }
//     ;
//   }
    
// }
