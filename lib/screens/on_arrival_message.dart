import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnArrivalMessage extends StatefulWidget {
  const OnArrivalMessage({Key? key}) : super(key: key);

  @override
  State<OnArrivalMessage> createState() => _OnArrivalMessageState();
}

class _OnArrivalMessageState extends State<OnArrivalMessage> {
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'Food Arrived',
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 2,
              child: Text(
                'Rate Us',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Icon(Feather.star),
            SizedBox(
              height: 150.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFormField(
                  controller: commentController,
                  cursorColor: Theme.of(context).accentColor,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Add a comment',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Icon(
                        Feather.message_circle,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 2,
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'DONE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      // bottomSheet: Container(
      //   decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      //   height: MediaQuery.of(context).size.height * 0.1,
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: TextFormField(
      //           decoration: InputDecoration(),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
