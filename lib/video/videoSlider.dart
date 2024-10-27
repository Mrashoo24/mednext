import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mednextnew/Auth/Controller/videoController.dart';

class VideoSlides extends StatefulWidget {
  const VideoSlides({super.key});

  @override
  State<VideoSlides> createState() => _VideoSlidesState();
}

class _VideoSlidesState extends State<VideoSlides> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(

        builder: (videoControler) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Video Player"),
        ),
        body: ListView.builder(
          itemCount: videoControler.selectedVideoModel!.slides!.length,
          itemBuilder: (context, index) {

            var currentImage =  videoControler.selectedVideoModel!.slides![index];

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  currentImage.toString(),
                  fit: BoxFit.cover,),
              ),
            );
          },),
      );
    });
  }
}
