import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinksInAbout extends StatelessWidget {
  const LinksInAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Icon(
                Feather.star,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(
                width: 20.h,
              ),
              Text(
                "Rate the App",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Divider(
          height: 2.h,
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          height: 30.h,
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Icon(
                Feather.star,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(
                width: 20.h,
              ),
              Text(
                "Like us on facebook",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Divider(
          height: 2.h,
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
