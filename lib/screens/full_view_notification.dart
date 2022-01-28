import 'package:flutter/material.dart';


class FullViewNotification extends StatelessWidget {

  const FullViewNotification(
      {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // final fullDescrip = ModalRoute.of(context)!.settings as Map<String, Object>;

    // final textTitle = fullDescrip['title'];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        // title: Text(textTitle.toString()),
      ),
    );
  }
}
