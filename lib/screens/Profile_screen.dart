import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widget/back_arrow.dart';
import '../auth/auth_controllers/authMode.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void toProfileSettings(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/profilesettings');
  }

  void toAboutScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/about');
  }

  void toPaymentScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/paym');
  }

  void toHistoryScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/history');
  }

  User? user = FirebaseAuth.instance.currentUser;
  Auth loggedInUser = Auth();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
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
      body: loggedInUser.fullName == null || loggedInUser.phoneNumber == null
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            )
          : SafeArea(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 77.h,
                          width: 77.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          child: const Icon(
                            Icons.person,
                            size: 40,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${loggedInUser.fullName}",
                                  style: TextStyle(
                                      fontFamily: 'Poppin',
                                      fontSize: 20,
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${loggedInUser.phoneNumber}",
                                  style: const TextStyle(
                                      letterSpacing: 1, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => toProfileSettings(context),
                          child: Container(
                            height: 29,
                            width: 29,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.withOpacity(0.2)),
                            child: const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PREFERENCES',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 55.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Container(
                                  height: 36.h,
                                  width: 36.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey),
                                  child: Image.asset(
                                    'assets/images/icons/language.png',
                                    scale: 0.8,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Language',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(right: 5.0),
                                        child: Text(
                                          'English',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 17,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 55.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.20),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Container(
                                  height: 36.h,
                                  width: 36.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey),
                                  child: Image.asset(
                                    'assets/images/icons/Vector.png',
                                    scale: 0.8,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Dark Mode',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              Text(
                                'on',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              Switch(
                                activeColor: Theme.of(context).primaryColor,
                                value: true,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 55.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.20),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Container(
                                  height: 36.h,
                                  width: 36.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red),
                                  child: Image.asset(
                                    'assets/images/icons/flat-color-icons_like.png',
                                    scale: 0.8,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Notifications',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              Text(
                                'on',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              Switch(
                                activeColor: Theme.of(context).primaryColor,
                                value: true,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Invite friends',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 18,
                                    letterSpacing: 2,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'assets/images/icons/codicon_live-share.png',
                                scale: 1.1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        GestureDetector(
                          onTap: () => toHistoryScreen(context),
                          child: Text(
                            'History',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 18,
                                letterSpacing: 2,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                        const Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            'List',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () => toAboutScreen(context),
                          child: Container(
                            width: double.maxFinite,
                            height: 55.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Container(
                                    height: 36.h,
                                    width: 36.w,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: Image.asset(
                                      'assets/images/icons/alert-circle.png',
                                      scale: 0.8,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'About',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 17,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () => toPaymentScreen(context),
                          splashColor: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: double.maxFinite,
                            height: 55.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Container(
                                    height: 36.h,
                                    width: 36.w,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: Icon(Icons.payment_outlined,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Payment',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 17,
                                    color: Theme.of(context).accentColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
