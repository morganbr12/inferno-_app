import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),

      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35.h,
              ),
              Container(
                height: 98.h,
                width: 98.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).accentColor
                ),
                child: Icon(
                    Icons.person_outline,
                  size: 50.r,
                ),
              ),

              SizedBox(
                height: 25.h,
              ),

              Text(
                  'Upload Photo',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
              ),

              SizedBox(
                height: 40.h,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
