import 'package:flutter/material.dart';

class AutomatedVideoPlay extends StatefulWidget {
  const AutomatedVideoPlay({Key? key}) : super(key: key);

  @override
  _AutomatedVideoPlayState createState() => _AutomatedVideoPlayState();
}

class _AutomatedVideoPlayState extends State<AutomatedVideoPlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
