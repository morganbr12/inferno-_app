import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widget/back_arrow.dart';

class NotifyingClientOrderHasBeenPlaced extends StatelessWidget {
  const NotifyingClientOrderHasBeenPlaced({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButtons(context),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 281.h,
            width: 259.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              child: Image.asset(
                'assets/images/ellipse.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 70.h,
          ),

          // text under the image

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Order has been placed",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet,'
              'consectetur adipiscing elit. Eget amet '
              'rhoncus enim enim morbi eget. Nulla accumsan,'
              ' pharetra ac, nullam in nulla mauris sollicitudin. ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),

          SizedBox(
            height: 130.h,
          ),

          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/tracking', (route) => false);
            },
            child: Text(
              'Track Your Order',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
