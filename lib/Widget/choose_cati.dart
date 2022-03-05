import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseFoodItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  const ChooseFoodItem(this.title, this.imageUrl, {Key? key}) : super(key: key);

  void toCatergoryPageScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        // color: const Color.fromRGBO(218, 218, 218, 1),
        child: Container(
          height: 80.h,
          // width: 80.w,
          padding: const EdgeInsets.only(
            left: 10,
            top: 7,
            right: 10,
            bottom: 7,
          ),
          decoration: BoxDecoration(
            // color: Colors.white12,
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    imageUrl,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
