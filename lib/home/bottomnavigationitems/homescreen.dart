import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mednextnew/Auth/loginscreen.dart';
import 'package:mednextnew/constants/colors.dart';
import 'package:mednextnew/home/bottomnavigationitems/me_page.dart';
import 'package:mednextnew/home/bottomnavigationitems/q_bank.dart';
import 'package:mednextnew/home/bottomnavigationitems/video_page.dart';

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
    int index =0;
    List<Widget> widgetList =  [
    //  Homescreenone(),
      VideoPage(),
      Qbank(),
      MePage(),
    ];
  @override
  void intiState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AuthController>(
          init: authController,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Medical PG",
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications_outlined),
                  onPressed: (){
                    Get.to(Notificationscreen());
                  },
                )
              //  Image.asset("m")
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
             // currentIndex: 1,
              onTap: (index){
                setState(() {
                  index = index;
                });

                },
              currentIndex: index,
              items: [
              BottomNavigationBarItem(icon: Icon(Icons.home,color: kdeepblue,),
                label: 'Home',

              ),
              BottomNavigationBarItem(icon: Icon(Icons.play_arrow_outlined,color: kdeepblue,),
                label: 'Video',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.pending_actions_sharp,color: kdeepblue,),
                label: 'Qbank',

              ),
              BottomNavigationBarItem(icon: Icon(Icons.label,color: kdeepblue,),
                label: 'Test',
              ),
                  BottomNavigationBarItem(icon: Icon(Icons.person,color: kdeepblue,),
                  label: 'Me',
                )
            ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                                        child: Image.asset("asset/banner.png"),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          child: Image.asset('asset/banner.png'),
                        ) ,
                        SizedBox(width: 10,),
                           Container(
                             child: Image.asset("asset/banner.png"),
                           ),
                        SizedBox(width: 10,),
                        Container(
                          child: Image.asset("asset/banner.png"),
                        )
                      ],
                    ),
                      ),
               SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Good Morning Parul!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ElevatedButton(
                        onPressed: () {
                          // Define your button action here
                          setState(() {

                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // Ensures the button is as wide as its content
                          children: [
                            Text(
                              'Psychology',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(width: 8), // Space between text and icon
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ],
                  ),


                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.all(16.0),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Dr Soumen Manna ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text('Rating ')
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Homeostasis',style: TextStyle(fontWeight:FontWeight.bold),),
                                  SizedBox(

                                    width: 120,
                                  ),
                                  Text('4.5'),
                                 SizedBox(width: 20),
                                  Icon(Icons.star,color: Colors.red,)
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),








                  SizedBox(height: 15,),
                  Image.asset("asset/videpbanner.png"),
                    SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("My Subjects",style: TextStyle(fontSize: 25),),
                        Icon(Icons.apps,color: kdeepblue,),
                      ],
                    ),
                  ) ,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),

                                           color: klightblue
                          ),
                          child: Center(child: Text('All Subjects')),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),

                              color: klightblue
                          ),
                          child: Center(child: Text('Anatomy')),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),

                              color: klightblue
                          ),
                          child: Center(child: Text('Physiology')),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),

                              color: klightblue
                          ),
                          child: Center(child: Text('Bio Chemistry')),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),

                              color: klightblue
                          ),
                          child: Center(child: Text('Micro Biology')),
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("View More",style: TextStyle(color: kdeepblue),
                  ),
                  SizedBox(height: 10,),
                  Image.asset("asset/recentupdates.png"),
                  SizedBox(height: 10,),
                  Image.asset("asset/Qofday.png"),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Quick Links",style: TextStyle(fontSize: 25),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Image.asset("asset/buttons.png"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Video of the day",style: TextStyle(fontSize: 25),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Image.asset("asset/videoofday.png"),
                  SizedBox(height: 10,),


                ],
              ),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Image.asset("asset/Logo med 1.png"),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: ListTile(
                      title: Row(
                       // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("asset/hat.png",color: kdeepblue,),
                          SizedBox(width: 10,),
                          Text("Explore Courses",),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: ListTile(
                      title: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("asset/price.png",color: kdeepblue,),
                          SizedBox(width: 10,),
                          Text("Pricing Plan",),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: ListTile(
                      title: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("asset/share.png",color: kdeepblue,),
                          SizedBox(width: 10,),
                          Text("Share",),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: ListTile(
                      title: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("asset/time.png",color: kdeepblue,),
                          SizedBox(width: 10,),
                          Text("Practice Reminder",),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: ListTile(
                      title: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("asset/save.png",color: kdeepblue,),
                          SizedBox(width: 10,),
                          Text("My Saved List",),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: ListTile(
                      title: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("asset/wallet.png",color: kdeepblue,),
                          SizedBox(width: 10,),
                          Text("My Purchase",),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: ListTile(
                      title: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.person_add_alt_outlined,color: kdeepblue,),
                          SizedBox(width: 10,),
                          Text("Refer a friend",),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){

                    },
                    child: ListTile(
                      title: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.call,color: kdeepblue,),
                          SizedBox(width: 10,),
                          Text("Need Help/Support",),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.find<AuthController>().logout();
                    },
                    child: ListTile(
                      title: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.logout,color: kdeepblue,),
                          SizedBox(width: 10,),
                          Text("Logout",),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
              );
        }
      ),
    );
  }
}
