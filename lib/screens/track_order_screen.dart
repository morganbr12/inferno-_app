import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Widget/back_arrow.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    const title = Text('Track Order');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 43.h,
          title: title,
          centerTitle: true,
          leading: leadingIcon(context),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 442.h,
                  width: double.maxFinite,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(color: Colors.red)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: const GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(5.668817, -0.1877119),
                        zoom: 15,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 340,
                  left: 35,
                  child: Container(
                    height: 70.h,
                    width: 264.w,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(252, 252, 252, 1),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 51.h,
                          width: 51.w,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child:
                                Image.asset('assets/images/ryder/ryder1.png'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 8),
                                child: Text(
                                  'Thomas Yeboah',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Text(
                                'Your Ryder',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              height: 40.h,
                              width: 40.w,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1)),
                              child: Image.asset(
                                  'assets/images/icons/carbon_phone.png')),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 51.h,
                      width: 51.w,
                      margin: const EdgeInsets.only(left: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: ClipRRect(
                        child: Image.asset('assets/images/icons/clock.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Delivery Time',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
                          child: Text(
                            '25 Minutes',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Column(
                    children: [
                      Container(
                        height: 10,
                        width: 3,
                        decoration: const BoxDecoration(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 10,
                        width: 3,
                        decoration: const BoxDecoration(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 10,
                        width: 3,
                        decoration: const BoxDecoration(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 10,
                        width: 3,
                        decoration: const BoxDecoration(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 51.h,
                      width: 51.w,
                      margin: const EdgeInsets.only(left: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: ClipRRect(
                        child: Image.asset('assets/images/icons/home.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Delivery Address',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
                          child: Text(
                            'Bavaria Street',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                horizontal: 130.w, vertical: 20.h),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                      child: Text(
                        'Detail Order',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
