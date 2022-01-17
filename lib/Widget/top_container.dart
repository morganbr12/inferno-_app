import 'package:flutter/material.dart';




class HomePageTopContainer extends StatefulWidget {
  const HomePageTopContainer({Key? key}) : super(key: key);

  @override
  State<HomePageTopContainer> createState() => _HomePageTopContainerState();
}

class _HomePageTopContainerState extends State<HomePageTopContainer> {
  final List<String> imageList = [
    'assets/images/carouselimg.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.of(context).size.width * 0.35,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          // child: ,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
            ),
          ],
        )
      ],
    );
  }
}
