import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget leadingIcon(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    icon: Icon(
      Feather.arrow_left,
      color: Theme.of(context).accentColor,
    ),
  );
}

Widget IconButtons(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/homepage',
        ((route) => false),
      );
    },
    icon: Icon(
      Icons.close,
      color: Theme.of(context).accentColor,
    ),
  );
}
