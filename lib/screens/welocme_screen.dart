import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inferno/Widget/slider.dart';


import '../models/slide.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  void toLoginPage(BuildContext ctx) {
    Navigator.of(ctx).popAndPushNamed('/login');
  }

  @override
  Widget build(BuildContext context) {

    final pageController = 0;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/welcomeImage/welcome.png'),
            Container(
              height: 363.h,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(22, 22, 34, 1)
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 3.h,
                    width: 38.w,
                    color: Colors.grey,
                  ),

                  const SizedBox(
                    height: 43,
                  ),

                  Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      // controller: pageController,
                      itemCount: SliderList.length,
                        itemBuilder: (ctx, i) => SliderItem(i),
                    ),
                  ),

                  SizedBox(
                    height: 33.h,
                  ),

                  ElevatedButton(
                      onPressed: () => toLoginPage(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                          ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(
                          horizontal: 100.w,
                          vertical: 16.h
                        ),
                      )
                    ),
                      child: const Text(
                          'Get Started',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                  ),

                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ]
      ),
    );
  }
}
