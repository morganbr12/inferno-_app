import 'package:flutter/material.dart';


class ViewAllFood extends StatelessWidget {
  const ViewAllFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Text(
      'All Product',
      style: Theme.of(context).textTheme.headline6,
    );
    return Scaffold(
      appBar: AppBar(
        title: title,
        centerTitle: true,
      ),
    );
  }
}
