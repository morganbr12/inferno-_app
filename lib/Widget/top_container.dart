import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePageTopContainer extends StatefulWidget {
  const HomePageTopContainer({Key? key}) : super(key: key);

  @override
  State<HomePageTopContainer> createState() => _HomePageTopContainerState();
}

class _HomePageTopContainerState extends State<HomePageTopContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: 150.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Carousel(
            boxFit: BoxFit.fill,
            autoplay: false,
            animationCurve: Curves.easeIn,
            // animationDuration: const Duration(milliseconds: 1000),
            dotSize: 4.0,
            dotIncreasedColor: Theme.of(context).primaryColor,
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.bottomCenter,
            indicatorBgPadding: 5.0,
            showIndicator: true,
            borderRadius: true,
            images: const [
              ExactAssetImage("assets/images/carouselim.png"),
              NetworkImage(
                  'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
              NetworkImage(
                  'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
            ],
          ),
        ),
      ),
    );
  }
}
