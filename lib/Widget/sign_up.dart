import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();





  void toVerifySignUp(BuildContext ctx) {
    Navigator.of(context).pushNamed('/verifysignup');
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey _keyForm = GlobalKey();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
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
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(22, 22, 34, 1),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
            )
          ),
          child:
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Create New Account',
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).accentColor
                    ),
                  ),
                  Form(
                    key: _keyForm,
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
                             onSaved: (value) {

                             },
                           controller: firstNameController,
                           validator: (value1) {
                               if(value1!.isEmpty) {
                                 return 'first required';
                               }
                           },
                             decoration: const InputDecoration(
                               hintText: 'First Name',
                               enabledBorder: InputBorder.none,
                               focusedBorder: InputBorder.none,
                               contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                              if(value!.isEmpty) {
                                return 'last required';
                              }
                            },
                            onSaved: (value2){},
                            controller: secondNameController,
                          decoration: const InputDecoration(
                            hintText: 'Last Name',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                        ),         child: TextFormField(
                          cursorColor: Colors.black,
                          validator: (value) {
                            if(value!.isEmpty) {
                              return 'phone required';
                            }
                          },
                          controller: phoneNumberController,
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                              if(value!.isEmpty) {
                                return 'Email required';
                              }
                            },
                            onSaved: (value4) {
                            },
                            controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          ),
                        ),        ),
                      ]
                      )
                  ),

                  const SizedBox(
                    height: 0,
                  ),

                  // ElevatedButton

                  ElevatedButton(
                      onPressed: () => toVerifySignUp(context),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(203, 160, 68, 1),
                        ),
                        padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 0, 30, 0))
                    ),
                      child: const Text(
                          'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'or Sign up using',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                          ),
                        ),
                      )
                    ],
                  ),
               Container(
                 margin: const EdgeInsets.only(left: 20, right: 20),
                 child: ElevatedButton(
                   onPressed: () {},
                   style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all( const Color.fromRGBO(212, 70, 56, 1))
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset(
                         'assets/images/icons/gmail.png',
                         scale: 1.6,
                       ),
                       const SizedBox(width: 10,),
                       const Text(
                         'Connect with Gmail',
                         style: TextStyle(
                             fontSize: 18,
                             letterSpacing: 1
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all( const Color.fromRGBO(66, 103, 178, 1))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icons/facebook.png',
                            scale: 1.6,
                          ),
                          const SizedBox(width: 10,),
                          const Text(
                            'Connect with facebook',
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
          ]
        )
        ),
      ],
    );
  }
}
