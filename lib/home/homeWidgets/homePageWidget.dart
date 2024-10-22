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
  Map<String, dynamic>? videoOftheday ;

  var _currentIndex = 0;
  @override
  void initState() {
    setState(() {
      listOfImage = RemoteConfigService().getHomeBanner();
      videoOftheday = RemoteConfigService().getVideoOfTheDay();
    });


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
                      padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Quick Links",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildQuickLinksItems("asset/notes.png", "Notes"),
                        buildQuickLinksItems("asset/bookmark.png", "Bookmarks"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Video of the day",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                   if(videoOftheday != null) videoOfTheDayComponent(videoOftheday!["thumbnail"], videoOftheday!["title"], videoOftheday!["subtitle"], videoOftheday!["link"]),
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

  Column buildQuickLinksItems(String img,String title) {
    return Column(
                    children: [
                      Image.asset(img),
                      SizedBox(height: 5,),
                      Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                    ],
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


}
