import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/slide.dart';

class SliderItem extends StatelessWidget {
  final int index;

  const SliderItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: 72.h,
          width: 183.w,
          child: Text(
            SliderList[index].title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(left: 48, right: 48),
            child: Text(
              SliderList[index].description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
        ),
        SizedBox(
          height: 43.h,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
            SizedBox(
              width: 5.w,
            ),
            Container(
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
            SizedBox(
              width: 5.w,
            ),
            Container(
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
