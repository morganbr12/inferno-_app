import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: <Widget>[
          // const Text("Payment Method"),
          SizedBox(height: 10.h),
          Row(
            children: <Widget>[Container(), Container()],
          ),
          Container()
        ]),
      ),
    );
  }
}
