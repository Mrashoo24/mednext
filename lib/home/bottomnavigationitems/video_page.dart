import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mednextnew/Auth/Controller/AuthController.dart';
import 'package:mednextnew/Auth/Controller/categoryController.dart';
import 'package:mednextnew/Auth/Controller/videoController.dart';
import 'package:mednextnew/constants/colors.dart';

import '../../constants/global.dart';
import '../SubVideoSection/free_video.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();


}


class _VideoPageState extends State<VideoPage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  void initState() {

    super.initState();
    // Initialize TabController with 3 tabs
    _tabController = TabController(length: 3, vsync:  this);
  }
  void dispose() {
    // Dispose TabController when the page is closed
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(

      body: Column(
        children: [
          Padding (
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for videos, Qbanks',
                prefixIcon: Icon(Icons.search,color: klightGrey,), // Search icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: klightGrey,), // Border color when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: klightGrey,), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: klightGrey, width: 1), // Border when focused
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                filled: true,
                fillColor: Colors.grey[100], // Background color for the search bar
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: klightGrey, // Color for the selected tab indicator
            tabs: [
              Tab(
                icon: Icon(Icons.play_circle_fill,color: kgreen,size: 25,),
                text: "Free Videos",),
              Tab(
                  icon: Icon(Icons.play_circle_fill,color: korange,size: 25,),
                  text: "Saved Videos"),
              Tab(
                  icon: Icon(Icons.waves,color: kred,size: 25,),
                  text: "Live Lectures"),
            ],
          ),
      Expanded(
      child: TabBarView(
      controller: _tabController,
      children: [
        FreeVideo(),

        // Saved Videos Tab Content
        GetBuilder<AuthController>(
          builder: (authController) {
            return Scaffold(
              body:authController.userData!.savedVideos?.isEmpty ?? true
                  ? SizedBox.shrink()
                  : Flexible(
                    child: ListView.builder(
                      itemCount: authController.userData!.savedVideos?.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {

                        var videoList = authController.userData!.savedVideos![index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: buildQBankItem(videoController.videos.firstWhereOrNull((e) => e.videoId == videoList), index,[]),
                        );
                      },
                    ),
                  )
              ,
            );
          }
        ),

        // Live Lectures Tab Content
        Center(child: Text('Live Lectures content goes here')),
      ],
    ),
      ),
        ],
      ),
    ),
    );
  }

}
