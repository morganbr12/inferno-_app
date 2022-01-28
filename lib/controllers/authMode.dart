import 'package:flutter/widgets.dart';


import 'package:flutter/cupertino.dart';

enum AuthMode {
  SignUp,
  SignIn
}


class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;


  Future<void> signup(
      String email,
      int phoneNumber,
      String firstName,
      String lastName,
      ) async {

  }
}


