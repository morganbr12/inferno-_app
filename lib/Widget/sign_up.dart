import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void toVerifySignUp(BuildContext ctx) {
    Navigator.of(context).pushNamed('/verifysignup');
  }
  @override
  Widget build(BuildContext context) {
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
                         child: const TextField(
                             cursorColor: Colors.black,
                             decoration: InputDecoration(
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
                          ),         child: const TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
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
                        ),         child: const TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
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
                        ),         child: const TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
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

    //   Column(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     const SizedBox(
    //       height: 60,
    //     ),
        // Image.asset(
        //   'assets/images/logoInferno.png',
        //   scale: 2,
        // ),
    //     const SizedBox(
    //       height: 15,
    //     ),
    //     Container(
    //       height: MediaQuery.of(context).size.height * 0.7,
    //       decoration: const BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(32),
    //             topRight: Radius.circular(32),
    //           )
    //       ),
    //       child: Column(
    //         // mainAxisAlignment: MainAxisAlignment.start,
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           const Text(
    //             'Create an account',
    //             style: TextStyle(
    //                 fontSize: 30,
    //                 fontWeight: FontWeight.w300
    //             ),
    //           ),
    //           Container(
    //             height: 40,
    //             margin: const EdgeInsets.all(10),
    //             padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
    //             decoration: BoxDecoration(
    //                 color: Colors.grey.withOpacity(0.2),
    //                 border: Border.all(color: Colors.grey.withOpacity(0.2)),
    //                 borderRadius: BorderRadius.circular(10)
    //             ),
    //             child: const TextField(
    //               cursorColor: Colors.black,
    //               decoration: InputDecoration(
    //                 enabledBorder: InputBorder.none,
    //                 border: InputBorder.none,
    //                 hintText: 'First Name',
    //               ),
    //             ),
    //           ),
    //           Container(
    //             height: 40,
    //             margin: const EdgeInsets.all(10),
    //             padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
    //             decoration: BoxDecoration(
    //                 color: Colors.grey.withOpacity(0.2),
    //                 border: Border.all(color: Colors.grey.withOpacity(0.2)),
    //                 borderRadius: BorderRadius.circular(10)
    //             ),
    //             child: const TextField(
    //               cursorColor: Colors.black,
    //               decoration: InputDecoration(
    //                 enabledBorder: InputBorder.none,
    //                 border: InputBorder.none,
    //                 hintText: 'Last Name',
    //               ),
    //             ),
    //           ),
    //           Container(
    //             height: 40,
    //             margin: const EdgeInsets.all(10),
    //             padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
    //             decoration: BoxDecoration(
    //                 color: Colors.grey.withOpacity(0.2),
    //                 border: Border.all(color: Colors.grey.withOpacity(0.2)),
    //                 borderRadius: BorderRadius.circular(10)
    //             ),
    //             child: const TextField(
    //               cursorColor: Colors.black,
    //               decoration: InputDecoration(
    //                 enabledBorder: InputBorder.none,
    //                 border: InputBorder.none,
    //                 hintText: 'Email',
    //               ),
    //             ),
    //           ),
    //           Container(
    //             height: 40,
    //             margin: const EdgeInsets.all(10),
    //             padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
    //             decoration: BoxDecoration(
    //                 color: Colors.grey.withOpacity(0.2),
    //                 border: Border.all(color: Colors.grey.withOpacity(0.2)),
    //                 borderRadius: BorderRadius.circular(10)
    //             ),
    //             child: const TextField(
    //               cursorColor: Colors.black,
    //               decoration: InputDecoration(
    //                 enabledBorder: InputBorder.none,
    //                 border: InputBorder.none,
    //                 hintText: 'Phone Number',
    //               ),
    //             ),
    //           ),
    //
    //           ElevatedButton(
    //             onPressed: () {},
    //             style: ButtonStyle(
    //                 backgroundColor: MaterialStateProperty.all(
    //                   const Color.fromRGBO(203, 160, 68, 1),
    //                 ),
    //                 padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 0, 30, 0))
    //             ),
    //             child: const Text(
    //               'Sign Up',
    //               style: TextStyle(
    //                   fontSize: 20
    //               ),
    //             ),
    //           ),
    //
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 10.0),
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: const [
    //                 Text('or sign up using'),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             margin: const EdgeInsets.only(left: 20, right: 20),
    //             child: ElevatedButton(
    //               onPressed: () {},
    //               style: ButtonStyle(
    //                   backgroundColor: MaterialStateProperty.all( const Color.fromRGBO(212, 70, 56, 1))
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Image.asset(
    //                     'assets/images/icons/gmail.png',
    //                     scale: 1.6,
    //                   ),
    //                   const SizedBox(width: 10,),
    //                   const Text(
    //                     'Connect with Gmail',
    //                     style: TextStyle(
    //                         fontSize: 18,
    //                         letterSpacing: 1
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Container(
    //             margin: const EdgeInsets.only(left: 20, right: 20),
    //             child: ElevatedButton(
    //               onPressed: () {},
    //               style: ButtonStyle(
    //                 backgroundColor: MaterialStateProperty.all(
    //                   const Color.fromRGBO(52, 172, 224, 1),
    //                 ),
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Image.asset(
    //                     'assets/images/icons/outlook.png',
    //                     scale: 1.3,
    //                   ),
    //                   const SizedBox(width: 10,),
    //                   const Text(
    //                     'Connect with Gmail',
    //                     style: TextStyle(
    //                         fontSize: 18,
    //                         letterSpacing: 1
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Container(
    //             margin: const EdgeInsets.only(left: 20, right: 20),
    //             child: ElevatedButton(
    //               onPressed: () {},
    //               style: ButtonStyle(
    //                 backgroundColor: MaterialStateProperty.all(
    //                   const Color.fromRGBO(34, 112, 147, 1),
    //                 ),
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Image.asset(
    //                     'assets/images/icons/facebook.png',
    //                     scale: 1.3,
    //                   ),
    //                   const SizedBox(width: 10,),
    //                   const Text(
    //                     'Connect with Gmail',
    //                     style: TextStyle(
    //                         fontSize: 18,
    //                         letterSpacing: 1
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );

  }
}
