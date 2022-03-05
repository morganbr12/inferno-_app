import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Payment Methods",
          style: TextStyle(
            color: Theme.of(context).accentColor,
            letterSpacing: 1,
            fontSize: 17,
          ),
        ),
        SizedBox(
          height: 40.w,
        ),
        Row(
          children: <Widget>[
            Icon(
              Foundation.dollar_bill,
              color: Theme.of(context).accentColor,
              size: 30,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              'Cash',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
            const Spacer(),
            Checkbox(
              value: true,
              onChanged: (val) {
                setState(() {});
              },
              activeColor: Theme.of(context).primaryColor,
            )
          ],
        ),
        const Divider(
          color: Colors.grey,
        ),
        SizedBox(
          height: 20.w,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Mobile money",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 16,
              letterSpacing: 1,
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
        SizedBox(
          height: 20.w,
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: <Widget>[
              Icon(
                Feather.credit_card,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                'Add debit/ Credit card',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).accentColor,
              )
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
