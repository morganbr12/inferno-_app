import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:inferno/auth/auth_controllers/authMode.dart';
// import '../auth/countrys.dart';

class VerifySignUp extends StatefulWidget {
  VerifySignUp({Key? key}) : super(key: key);

  @override
  State<VerifySignUp> createState() => _VerifySignUpState();
}

class _VerifySignUpState extends State<VerifySignUp> {
  // String verificationIDFinal = "";
  // String smsCode = "";

  // final AuthMode authClass = AuthMode();
  // void toCodeVerification(BuildContext ctx) {
  //   Navigator.of(ctx).pushNamed('/codeverify');
  // }

  // final TextEditingController _phoneNumberController = TextEditingController();

  // void setData() {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    final getPhoneNumber = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(22, 22, 34, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 220,
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Verify Your Phone Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Theme.of(context).accentColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    'We will send you an SMS with a code to the number '
                    ' $getPhoneNumber',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1,
                        color: Theme.of(context).accentColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 46,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        // searchValue = value;
                      });
                    },
                    // controller: _searchController,
                    decoration: InputDecoration(
                        label: Text('+233'),
                        suffixIcon: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const CountryCodePage()));
                            },
                            icon: const Icon(Icons.arrow_drop_down)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.fromLTRB(28, 10, 0, 10)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 46,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    // controller: _phoneNumberController,
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(203, 160, 68, 1),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  )),
              child: const Text(
                'Send Code',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryCodePage extends StatefulWidget {
  const CountryCodePage({Key? key}) : super(key: key);

  @override
  _CountryCodePageState createState() => _CountryCodePageState();
}

class _CountryCodePageState extends State<CountryCodePage> {
  List<dynamic>? dataRetrieved; // data decoded from the json file
  List<dynamic>? data; // data to display on the screen
  // var _searchController = TextEditingController();
  var searchValue = "";

  @override
  void initState() {
    _getData();
  }

  Future _getData() async {
    final String response =
        await rootBundle.loadString('assets/CountryCodes.json');
    dataRetrieved = await json.decode(response) as List<dynamic>;
    setState(() {
      data = dataRetrieved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        toolbarHeight: 30,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).accentColor,
                      ),
                      cursorColor: Theme.of(context).accentColor,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 15,
                          ),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none),
                      onChanged: (value) {
                        setState(() {
                          searchValue = value;
                        });
                      },
                      // controller: _searchController,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate((data != null)
                    ? data!
                        .where((e) => e['name']
                            .toString()
                            .toLowerCase()
                            .contains(searchValue.toLowerCase()))
                        .map((e) => ListTile(
                              // onTap: () {
                              //   print(e['name']);
                              // },
                              title: Text(e['name']),
                              trailing: Text(e['dial_code']),
                            ))
                        .toList()
                    : [
                        const Center(
                          child: Text('Loading...'),
                        )
                      ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
