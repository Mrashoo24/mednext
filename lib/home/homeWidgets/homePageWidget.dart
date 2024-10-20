import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
  @override
  void initState() {
    setState(() {
      listOfImage = RemoteConfigService().getHomeBanner();
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

                    Image.asset("asset/recentupdates.png"),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("asset/Qofday.png"),
                    SizedBox(
                      height: 10,
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

}
