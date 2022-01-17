import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChooseFoodItem extends StatelessWidget {

  final String title;
  final String imageUrl;
  const ChooseFoodItem(
      this.title,
      this.imageUrl,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: const Color.fromRGBO(218, 218, 218, 1),
        child: Container(
          height: 70.h,
          // width: 80.w,
          padding: const EdgeInsets.only(
              left: 10, 
              top: 10, 
              right: 10, 
              bottom: 10,
          ),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                        imageUrl,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                Text(
                  title,
                ),
              ],
            ),
        ),
      ),
    );
  }
}
