import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationA extends StatefulWidget {
  final String id;
  final String imgUrl;
  final String textTopic;
  final String textDescription;

  const NotificationA(
  this.id,
      this.imgUrl,
      this.textTopic,
      this.textDescription,
  {Key? key}) : super(key: key);

  @override
  State<NotificationA> createState() => _NotificationAState();
}

class _NotificationAState extends State<NotificationA> {

 Widget buildText(String text) {
   const maxLines = 2;
   const overflow = TextOverflow.clip;
   return Container(
     width: 270.w,
     padding: const EdgeInsets.only(top: 5, bottom: 9),
     child: Text(
       text,
         maxLines: maxLines,
         overflow: overflow,
         textScaleFactor: 0.8,
         style: Theme.of(context).textTheme.bodyText1

     ),
   );
 }

 void toViewFullNotification(BuildContext ctx) {
   Navigator.of(ctx).pushNamed('/viewfullnotification',
       arguments: {
         'title': widget.textDescription,
       }
   );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toViewFullNotification(context),
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
        child: Row(
          children: [
            Container(
              height: 54.h,
                width: 54.w,
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                    child: Image.asset(
                      widget.imgUrl,
                      fit: BoxFit.cover,
                    ),
                ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.textTopic,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 16
                  ),
                ),

                buildText(
                        widget.textDescription,
                    ),
                
                Text(
                  '2 mins ago',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 11
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
