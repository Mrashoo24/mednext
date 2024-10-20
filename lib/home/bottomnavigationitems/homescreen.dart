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
import 'package:mednextnew/home/bottomnavigationitems/test_page.dart';
import 'package:mednextnew/home/bottomnavigationitems/video_page.dart';
import 'package:mednextnew/home/homeWidgets/homePageWidget.dart';
import 'package:mednextnew/home/homeWidgets/recommendedVideos.dart';

import '../../Adddetails/adddetails.dart';
import '../../Auth/Controller/AuthController.dart';
import '../../constants/global.dart';
import '../notificationscreen.dart';

class Homescreenone extends StatefulWidget {
  const Homescreenone({Key? key}) : super(key: key);

  @override
  State<Homescreenone> createState() => _HomescreenoneState();
}

class _HomescreenoneState extends State<Homescreenone> {
  int selectedindex = 0;
  List<Map<String, dynamic>> listOfImage = [];
  List<Widget> widgetList = [
    HomescreenWidget(),
    VideoPage(),
    Qbank(),
    TestPage(),
    MePage(),
  ];

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
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  "Medical PG",
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications_outlined),
                    onPressed: () {
                      Get.to(Notificationscreen());
                    },
                  )
                  //  Image.asset("m")
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                // currentIndex: 1,
                unselectedItemColor: klightGrey, // Color for unselected items
                selectedItemColor: kdeepblue,
                onTap: (index) {
                  setState(() {
                    selectedindex = index;
                  });
                },
                currentIndex: selectedindex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: kdeepblue,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.play_arrow_outlined,

                    ),
                    label: 'Video',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.pending_actions_sharp,

                    ),
                    label: 'Qbank',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.label,

                    ),
                    label: 'Test',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,

                    ),
                    label: 'Me',
                  )
                ],
              ),
              body:widgetList[selectedindex],
              drawer: Drawer(
                child: ListView(
                  children: [
                    ListTile(
                      title: Image.asset("asset/Logo med 1.png"),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "asset/hat.png",
                              color: kdeepblue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Explore Courses",
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "asset/price.png",
                              color: kdeepblue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Pricing Plan",
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "asset/share.png",
                              color: kdeepblue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Share",
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "asset/time.png",
                              color: kdeepblue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Practice Reminder",
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "asset/save.png",
                              color: kdeepblue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "My Saved List",
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "asset/wallet.png",
                              color: kdeepblue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "My Purchase",
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_add_alt_outlined,
                              color: kdeepblue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Refer a friend",
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.call,
                              color: kdeepblue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Need Help/Support",
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.find<AuthController>().logout();
                      },
                      child: ListTile(
                        title: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.logout,
                              color: kdeepblue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Logout",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

}
