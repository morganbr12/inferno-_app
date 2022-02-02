import 'package:flutter/material.dart';

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

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void toVerifySignUp(BuildContext ctx) {
    Navigator.of(context).pushNamed('/verifysignup');
  }

  void toLoginPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    // CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Future<void> addUser() {
    //   // Call the user's CollectionReference to add a new user

    //   return users
    //       .add({
    //         'userId': '',
    //         'firstName': firstNameController.text, // John Doe
    //         'lastName': secondNameController.text, // Stokes and Sons
    //         'phoneNumber': phoneNumberController.text,
    //         'email': emailController.text // 42
    //       })
    //       .then(
    //         (value) => Navigator.of(context).pushNamedAndRemoveUntil(
    //           '/verifysignup',
    //           (route) => false,
    //           arguments: phoneNumberController.text,
    //         ),
    //       )
    //       .catchError((error) => print("Failed to add user: $error"));
    // }

    final GlobalKey _keyForm = GlobalKey();
    return SingleChildScrollView(
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
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Create New Account',
                    style: TextStyle(
                        fontSize: 25, color: Theme.of(context).accentColor),
                  ),
                  Form(
                      key: _keyForm,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                            validator: (value1) {
                              if (value1!.isEmpty) {
                                return 'first required';
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
                              if (value!.isEmpty) {
                                return 'last required';
                              }
                            },
                            onSaved: (value2) {},
                            controller: phoneNumberController,
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
                              if (value!.isEmpty) {
                                return 'phone required';
                              }
                            },
                            controller: phoneNumberController,
                            decoration: const InputDecoration(
                              hintText: 'Email...',

                              // prefixIcon: Padding(
                              //   padding: EdgeInsets.symmetric(vertical: 9.0),
                              //   child: Text('  (+233) ',
                              //     style: TextStyle(
                              //     color: Colors.white,
                              //       fontSize: 15,
                              //   ),
                              //   ),
                              // ),
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email required';
                              }
                            },
                            onSaved: (value) {
                              passwordController =
                                  value as TextEditingController;
                            },
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
                      ])),

                  const SizedBox(
                    height: 0,
                  ),

                  // ElevatedButton

                  ElevatedButton(
                    onPressed: () {},
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
                ])),
          ],
        ),
      ),
    );
  }
}
