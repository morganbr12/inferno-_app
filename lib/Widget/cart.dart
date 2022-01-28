import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
          children: [
            Container(
              height: 88.h,
                width: 88.w,
                margin: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).accentColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/foodImages/burger.png',
                      fit: BoxFit.cover,
                    ),
                ),
            ),

            Expanded(
              flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text("Pizza",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                          fontSize: 12,
                          letterSpacing: 1
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('cheezy pizza',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 12,
                          letterSpacing: 1
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        '45.00',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16
                        ),
                      ),
                    )
                  ],
                )
            ),

            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                        Icons.delete,
                      color: Theme.of(context).accentColor,
                    ),
                ),


                Card(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Icon(
                                Icons.minimize,
                              color: Theme.of(context).accentColor,
                              size: 18,
                            ),
                          ),
                      ),
                      
                      Text('1'),

                      IconButton(
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).accentColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            )

          ],
        ),
      ),
    );
  }
}
