import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widget/back_arrow.dart';

class DeliveryAddressSelector extends StatefulWidget {
  const DeliveryAddressSelector({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressSelector> createState() =>
      _DeliveryAddressSelectorState();
}

class _DeliveryAddressSelectorState extends State<DeliveryAddressSelector> {
  final enterDeliveryAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButtons(context),
        title: Text(
          "Delivery Address",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                height: 54.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
                padding: const EdgeInsets.only(top: 3),
                child: TextFormField(
                  controller: enterDeliveryAddress,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: 'Enter a new address',
                    hintStyle: TextStyle(
                      color: Theme.of(context).accentColor.withOpacity(0.7),
                    ),
                    prefixIcon: Icon(
                      Feather.search,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/payments');
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Feather.navigation,
                      color: Theme.of(context).accentColor,
                      size: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Current location',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'New Road 610',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.7),
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
