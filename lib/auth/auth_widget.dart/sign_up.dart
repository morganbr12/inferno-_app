import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inferno/auth/auth_controllers/authMode.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final bool users1 = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void toLoginPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? const CircleAvatar()
        : SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logoInferno.png',
                    scale: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(22, 22, 34, 0.7),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Create New Account',
                          style: TextStyle(
                              fontSize: 25,
                              color: Theme.of(context).accentColor),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  onSaved: (value) {},
                                  controller: fullNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your full name';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Full name',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                            .hasMatch(value)) {
                                      return 'Enter your phone number';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {},
                                  controller: phoneNumberController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: 'Phone number',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
                                            .hasMatch(value)) {
                                      return 'Enter correct email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    hintText: 'Email...',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.only(left: 10, bottom: 5.0),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  obscureText: true,
                                  validator: (value) {
                                    RegExp regex = new RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return ("Please password is required");
                                    }

                                    if (!regex.hasMatch(value)) {
                                      return ("Enter a valid password(Min. 6 characters)");
                                    }
                                  },
                                  onSaved: (value) {
                                    passwordController =
                                        value as TextEditingController;
                                  },
                                  textInputAction: TextInputAction.done,
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                    hintText: 'Password...',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 0,
                        ),

                        // ElevatedButton

                        ElevatedButton(
                          onPressed: () {
                            signUp(
                                emailController.text, passwordController.text);
                            _isLoading == true;
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(203, 160, 68, 1),
                              ),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.fromLTRB(30, 0, 30, 0))),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 16,
                                  fontFamily: 'Poppins'),
                            ),
                            InkWell(
                              onTap: () => toLoginPage(context),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Future<void> signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(),
              })
          .catchError((e) {
        return Future.error(e.toString());
      });
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;
    Auth authModel = Auth();

    // writing all values
    authModel.email = user!.email;
    authModel.uid = user.uid;
    authModel.fullName = fullNameController.text;
    authModel.phoneNumber = phoneNumberController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(authModel.toMap());
    _isLoading = true;

    Navigator.of(context)
        .pushNamedAndRemoveUntil('/homepage', (route) => false);
  }
}
