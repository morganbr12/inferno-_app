import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageTopContainer extends StatefulWidget {
  const HomePageTopContainer({Key? key}) : super(key: key);

  @override
  State<HomePageTopContainer> createState() => _HomePageTopContainerState();
}

class _HomePageTopContainerState extends State<HomePageTopContainer> {
  final List<String> imageList = ['assets/images/carouselimg.png'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: 150.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          // child: ,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
            SizedBox(
              width: 4.w,
            ),
            Container(
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
