import 'package:flutter/material.dart';
import 'dart:convert';

class VerifyLogin extends StatelessWidget {
  const VerifyLogin({Key? key}) : super(key: key);

  void toInfernoHomePage(BuildContext ctx) {
    Navigator.of(ctx).popAndPushNamed('/homepage');
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
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Verify',
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Enter the code that has been sent to your phone',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 70,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                      child: const TextField(
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.fromLTRB(10, 10, 10, 10)),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                      child: const TextField(
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.fromLTRB(10, 10, 10, 10)),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                      child: const TextField(
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.fromLTRB(10, 10, 10, 10)),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                      child: const TextField(
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.fromLTRB(10, 10, 10, 10)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => toInfernoHomePage(context),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(203, 160, 68, 1),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      )),
                  child: const Text(
                    'Verify',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
