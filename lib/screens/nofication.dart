

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widget/notification.dart';
import '../models/notificationList.dart';

class NotificationArea extends StatelessWidget {


  const NotificationArea(
      {Key? key}) : super(key: key);




  Widget buildListTile(BuildContext context, NotificationList item) {
    const maxLines = 2;
    const overflow = TextOverflow.clip;
   return ListTile(
     onTap:  () => toViewFullNotification(context),
     leading: Image.asset(
         item.imgUrl,
       height: 54,
       width: 54,
     ),

     title: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(item.textTopic,
           style: TextStyle(
               color: Theme.of(context).accentColor,
               fontSize: 16
           ),
         ),


         Container(
           width: 270.w,
           padding: const EdgeInsets.only(top: 5, bottom: 9),
           child: Text(
               item.textDescription,
               maxLines: maxLines,
               overflow: overflow,
               textScaleFactor: 0.8,
               style: Theme.of(context).textTheme.bodyText1

           ),
         )
       ],
     ),
     subtitle: Text(
       '2 mins ago',
       style: TextStyle(
           color: Theme.of(context).primaryColor,
           fontSize: 11
       ),
     ),

     trailing: Column(

     ),
     // key: Key("${index}"),
     //      title: Column(
     //        children: listNotification.map((data) => NotificationA(
     //          data.id,
     //          data.imgUrl,
     //          data.textTopic,
     //          data.textDescription
     //      )).toList(),
     //    )
   );
  }

  // List<NotificationList> items = List.of(listNotification);

  void toViewFullNotification(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/viewfullnotification');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: listNotification.length,
        physics: const ScrollPhysics(parent: null),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30),
          child:  Divider(
            color: Colors.grey,

          ),
        ),
        itemBuilder: (context, index) {
        final item = listNotification[index];
        return buildListTile(context, item);
        },
    );
  }
}
