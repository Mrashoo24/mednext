import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mednextnew/Auth/Controller/updatesController.dart';
import 'package:mednextnew/Auth/loginscreen.dart';
import 'package:mednextnew/constants/carousalWidget.dart';
import 'package:mednextnew/constants/colors.dart';
import 'package:mednextnew/constants/firebaseRemotConfig.dart';
import 'package:mednextnew/home/bottomnavigationitems/me_page.dart';
import 'package:mednextnew/home/bottomnavigationitems/q_bank.dart';
import 'package:mednextnew/home/bottomnavigationitems/video_page.dart';
import 'package:mednextnew/home/homeWidgets/recommendedVideos.dart';
import 'package:mednextnew/home/homeWidgets/subjectVideoWidget.dart';

import '../../Adddetails/adddetails.dart';
import '../../Auth/Controller/AuthController.dart';
import '../../constants/global.dart';
import '../notificationscreen.dart';

class HomescreenWidget extends StatefulWidget {
  const HomescreenWidget({Key? key}) : super(key: key);

  @override
  State<HomescreenWidget> createState() => _HomescreenWidgetState();
}

class _HomescreenWidgetState extends State<HomescreenWidget> {
  int index = 0;
  List<Map<String, dynamic>> listOfImage = [];
  var _currentIndex = 0;
  @override
  void initState() {
    setState(() {
      listOfImage = RemoteConfigService().getHomeBanner();
    });
    updatesController.getUpdates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AuthController>(
          init: authController,
          builder: (controller) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    AutoCarouselWithIndicator(imgList: listOfImage),
                    SizedBox(
                      height: 10,
                    ),
                    RecommendedVideos(),

                    SizedBox(
                      height: 10,
                    ),

                    SubjectVideoWidget(),
                    SizedBox(
                      height: 35,
                    ),
                    recentUpdateComponent(),

                    SizedBox(
                      height: 10,
                    ),

                    quizComponent(),


                    // Image.asset("asset/Qofday.png"),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Quick Links",
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("asset/buttons.png"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Video of the day",
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("asset/videoofday.png"),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Column quizComponent() {
    return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0), // Add vertical padding to avoid clipping
                        child: SizedBox(
                          height: 140, // Adjust height to match the content of quizCard()
                          child: PageView.builder(
                            itemCount: 3, // Number of quiz cards
                            onPageChanged: (index) {
                              setState(() {
                                _currentIndex = index; // Update current index when page changes
                              });
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding to align cards
                                child: quizCard(), // Your quiz card widget
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10), // Space between PageView and dots
                      DotsIndicator(
                        dotsCount: 3, // Number of dots
                        position: _currentIndex, // Active dot position
                        decorator: DotsDecorator(
                          activeColor: Colors.black, // Active dot color
                          size: const Size.square(12.0), // Dot size
                          activeSize: const Size.fromRadius(6.0), // Active dot size
                        ),
                      ),
                    ],
                  );
  }

  Widget recentUpdateComponent() {
    return GetBuilder<UpdatesController>(
        init: updatesController,
        builder: (controller) {
      return controller.listOfUpdates.isEmpty ? SizedBox() :Builder(
        builder: (context) {
          var recentUpdate = controller.listOfUpdates.first;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              // You might want to set a background color
              boxShadow: [
                BoxShadow(
                  color:
                  Colors.black.withOpacity(0.2), // Shadow color
                  blurRadius: 4.0, // How blurry the shadow is
                  spreadRadius: 0.0, // How much the shadow spreads
                  offset:
                  Offset(0, 5), // Position of the shadow (x, y)
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Image.asset("asset/alarmicon.png"),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Recent Updates", style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kblack),),
                      Text("Updated on ${recentUpdate.uploadDate}", style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: kgrey),),
                    ],
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset("asset/rigthArrow.png")),
                  )
                ],
              ),
            ),
          );
        }
      );
    });
  }

}
