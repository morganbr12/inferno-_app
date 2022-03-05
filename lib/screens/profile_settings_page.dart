import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../auth/auth_controllers/authMode.dart';
import '../Widget/back_arrow.dart';
import '../Widget/image_picker.dart' as img;
import '../auth/auth_controllers/authMode.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  User? user = FirebaseAuth.instance.currentUser;
  Auth loggedInUser = Auth();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = Auth.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: leadingIcon(context),
      ),
      body: loggedInUser.fullName == null ||
              loggedInUser.email == null ||
              loggedInUser.phoneNumber == null
          ? Center(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            )
          : SafeArea(
              child: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35.h,
                    ),
                    const img.ImagePickery(),
                    SizedBox(
                      height: 40.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 20.0),
                              child: Text(
                                "Name",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Container(
                              width: 264.w,
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "     ${loggedInUser.fullName}",
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 16,
                                  leadingDistribution:
                                      TextLeadingDistribution.even,
                                  height: 1.5,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 20.0),
                              child: Text(
                                "Email",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Container(
                                width: 264.w,
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  width: 264.w,
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "   ${loggedInUser.email}",
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 20.0),
                              child: Text(
                                "Contact",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Container(
                              width: 264.w,
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                width: 264.w,
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "${loggedInUser.phoneNumber}",
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 150.h,
                    ),
                    TextButton(
                      onPressed: () => signOut(context),
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                            color: Color.fromRGBO(219, 29, 29, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> signOut(BuildContext ctx) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
  }
}
