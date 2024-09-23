import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mednextnew/Auth/loginscreen.dart';
import 'package:mednextnew/constants/colors.dart';

import '../Adddetails/adddetails.dart';
import 'notificationscreen.dart';

class Homescreenone extends StatefulWidget {
  const Homescreenone({Key? key}) : super(key: key);

  @override
  State<Homescreenone> createState() => _HomescreenoneState();
}

class _HomescreenoneState extends State<Homescreenone> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          onTap: (index){

          },
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
                   Image.asset("asset/username.png"),
              SizedBox(height: 15,),
              Image.asset("asset/videpbanner.png"),
                SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
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


            ],
          ),
        ),
    ),
    );
  }
}
