import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void toProfileSettings(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/profilesettings');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
      ),
      body: SafeArea(
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
                      shape: BoxShape.circle,
                      color: Colors.grey
                    ),
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
                          Text('Appiah Danquah',
                            style: TextStyle(
                              fontFamily: 'Poppin',
                              fontSize: 20,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                              '+233 55 306 1431',
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.grey
                            ),
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
                        color: Colors.grey.withOpacity(0.2)
                      ),
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
                      color: Colors.grey
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
                              color: Colors.grey
                            ),
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
                                  fontSize: 18
                                ),
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
                                    style: TextStyle(
                                      color: Colors.grey
                                    ),
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
                                color: Colors.grey
                            ),
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
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ),

                        Text('on',
                          style: TextStyle(
                            color: Theme.of(context).accentColor
                          ),
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
                                color: Colors.red
                            ),
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
                              'Receive Notification',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ),

                        Text('on',
                          style: TextStyle(
                              color: Theme.of(context).accentColor
                          ),
                        ),

                        Switch(
                          activeColor: Theme.of(context).primaryColor,
                          value: true,
                          onChanged: (value) {},
                        )
                      ],
                    ),
                  ),

                  const Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                        'List',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey
                      ),
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
                                color: Colors.red
                            ),
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
                                  fontSize: 18
                              ),
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
                                color: Colors.red
                            ),
                            child: Icon(Icons.payment_outlined,
                              color: Theme.of(context).accentColor
                            ),
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
                                  fontSize: 18
                              ),
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

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
