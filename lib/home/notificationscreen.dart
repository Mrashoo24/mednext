import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({Key? key}) : super(key: key);

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text( "Notifications"),
          leading: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.chevron_left,color: kblack,)),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("asset/Notification.png"),

                Image.asset("asset/noti.png"),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("asset/Notification.png"),
                // SizedBox(width: 10,),
                Image.asset("asset/noti.png"),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("asset/Notification.png"),
                // SizedBox(width: 10,),
                Image.asset("asset/noti.png"),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("asset/Notification.png"),
                // SizedBox(width: 10,),
                Image.asset("asset/noti.png"),
              ],
            ),
          ],
        ),
      ),
    );;
  }
}

