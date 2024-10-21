import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mednextnew/Auth/Controller/updatesController.dart';
import 'package:mednextnew/video/videoplayerScreen.dart';

import '../Auth/Controller/AuthController.dart';
import '../Auth/Controller/categoryController.dart';
import '../Auth/Controller/videoController.dart';
import '../data/models/videoModel.dart';
import 'colors.dart';

AuthController authController = Get.put(AuthController());
final GetStorage box = GetStorage();
var categoryController = Get.put(CategoryController());
VideoController videoController = Get.put(VideoController());
UpdatesController updatesController = Get.put(UpdatesController());

Widget videoThumnailCard(VideoModel? currentVideo,
    {String? teacherProfilePic}) {
  return currentVideo == null
      ? SizedBox()
      : InkWell(
    onTap: (){
      Get.to(VideoPlayerScreen());
    },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              // You might want to set a background color
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  blurRadius: 4.0, // How blurry the shadow is
                  spreadRadius: 0.0, // How much the shadow spreads
                  offset: Offset(0, 5), // Position of the shadow (x, y)
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (teacherProfilePic == null)
                        Stack(alignment: Alignment.center, children: [
                          Container(
                            width: 90,
                            height: 90,
                            child: ClipRRect(
                              child: Image.network(
                                currentVideo.thumbnail ?? "",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          ClipRRect(
                            child: Image.asset(
                              "asset/play_icon.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ]),
                      if (teacherProfilePic != null)
                        CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 40,
                          backgroundImage: AssetImage(
                            "asset/Male.png",
                          ),
                        ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dr Soumen Manna ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: kpurple,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Homeostasis',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: kblack,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Ratings",
                                        style:
                                            TextStyle(color: kgrey, fontSize: 12),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            currentVideo.ratings.toString(),
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: kyellow,
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                buildIconRow("${currentVideo.duration} Min",
                                    Icons.access_alarm),
                                // buildIconRow("${currentVideo.duration} Students",Icons.video_call_outlined),
                                // buildIconRow("7836 Students",Icons.access_alarm)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      );
}

Widget quizCard() {
  return false
      ? SizedBox()
      : Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            // You might want to set a background color
            boxShadow: [
              // BoxShadow(
              //   color: Colors.black.withOpacity(0.2), // Shadow color
              //   blurRadius: 4.0, // How blurry the shadow is
              //   spreadRadius: 0.0, // How much the shadow spreads
              //   offset: Offset(0, 5), // Position of the shadow (x, y)
              // ),
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pulmonology Image Based Questions',
                        style: TextStyle(
                          fontSize: 14,
                          color: kblack,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text(
                            "10 Ques",
                            style: TextStyle(
                                fontSize: 14, color: kblack),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.circle,
                            size: 2,
                            color: kblack,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "20 mins",
                            style: TextStyle(
                                fontSize: 14, color: kblack),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                        child: Text("Physiology",style: TextStyle(fontSize: 12,color: kskyblue),),
                        decoration: BoxDecoration(color: khighlighBlue.withOpacity(0.14),borderRadius: BorderRadius.circular(7)),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                        child: Text("Start Quizzes",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w600),),
                        decoration: BoxDecoration(color:kdeepblue,borderRadius: BorderRadius.circular(7)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
}

Row buildIconRow(String title, IconData icon) {
  return Row(
    children: [
      Icon(
        icon,
        size: 12,
        color: kgrey,
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        title,
        style: TextStyle(fontSize: 12, color: kgrey),
      ),
    ],
  );
}
