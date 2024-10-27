import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mednextnew/Auth/Controller/AuthController.dart';
import 'package:mednextnew/Auth/Controller/videoController.dart';
import 'package:mednextnew/constants/colors.dart';
import 'package:mednextnew/constants/global.dart';
import 'package:mednextnew/data/models/videoModel.dart';
import 'package:mednextnew/video/pdfViewScreen.dart';
import 'package:mednextnew/video/videoSlider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {

 final List<VideoModel> listOfVideoModel;

  const VideoPlayerScreen({super.key, this.listOfVideoModel = const []});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  TextEditingController reviewController = TextEditingController();
  int rating = 3;



  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      videoController.selectedVideoModel!.url ?? "",
    )..initialize().then((_) {
        setState(() {});
      });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: authController,
        builder: (authController) {
          return GetBuilder<VideoController>(
              init: videoController,
              builder: (videoController) {
                var isSavedVideos = authController.userData!.savedVideos!
                    .contains(videoController.selectedVideoModel!.videoId);

                return Scaffold(
                  resizeToAvoidBottomInset: true,
                  appBar: AppBar(
                    title: Text("Video Player"),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Video Player Section
                        if (_chewieController != null &&
                            _videoPlayerController.value.isInitialized)
                          Container(
                            height: 230,
                            child: Chewie(controller: _chewieController!),
                          )
                        else
                          Center(child: CircularProgressIndicator()),

                        // Title and buttons (Rate, Mark Complete)
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                videoController.selectedVideoModel?.title ?? "",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _openSubjectSelectionSheet(
                                          videoController.selectedVideoModel!);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: kdeepblue,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side:
                                                BorderSide(color: kdeepblue))),
                                    child: Text(
                                      "Mark Complete",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Ratings  ",
                                        style: TextStyle(
                                            fontSize: 14, color: kdeepblue),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 15,
                                      ),
                                      Text(
                                        videoController
                                                .selectedVideoModel?.ratings
                                                .toString() ??
                                            "",
                                        style: TextStyle(
                                            fontSize: 14, color: kdeepblue),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Row for additional functionalities (Save, Slides, Notes, Report Error)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  var newUsemodel;
                                  if (!isSavedVideos) {
                                    newUsemodel = authController.userData!
                                        .copyWith(savedVideos: [
                                      videoController
                                              .selectedVideoModel?.videoId ??
                                          "",
                                      ...(authController
                                              .userData?.savedVideos ??
                                          [])
                                    ]);
                                  } else {

                                    var videoList = authController.userData!.savedVideos!;
                                    videoList.remove( videoController
                                        .selectedVideoModel?.videoId);



                                    newUsemodel = authController.userData!.copyWith(savedVideos:videoList);
                                  }

                                  authController.updateAccount(newUsemodel);
                                  authController.update();
                                },
                                child: Column(
                                  children: [
                                    if (isSavedVideos)
                                      Icon(
                                        Icons.bookmark,
                                        color: kdeepblue,
                                      ),
                                    if (!isSavedVideos)
                                      Icon(
                                        Icons.bookmark_border,
                                        color: kgrey,
                                      ),
                                    Text(
                                      "Save",
                                      style:
                                          TextStyle(color: kgrey, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Get.to(VideoSlides());
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.slideshow,
                                      color: kgrey,
                                    ),
                                    Text(
                                      "Slides",
                                      style:
                                          TextStyle(color: kgrey, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () async {



                                 var file = await  videoController.createFileOfPdfUrl(videoController.selectedVideoModel!.notes_pdf ?? "");

                                  Get.to(PDFScreen(path:file.path.toString() ?? "",title: videoController.selectedVideoModel!.title,));
                                },
                                child: videoController.pdfLoading! ? Center(child: CircularProgressIndicator(),) : Column(
                                  children: [
                                    Icon(
                                      Icons.edit_note_outlined,
                                      color: kgrey,
                                    ),
                                    Text(
                                      "Notes",
                                      style:
                                          TextStyle(color: kgrey, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.flag_outlined,
                                    color: kgrey,
                                  ),
                                  Text(
                                    "Report Error",
                                    style:
                                        TextStyle(color: kgrey, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // TabBar for "Up Next", "Related QBank", "Ask Query"
                        DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              TabBar(
                                indicatorColor: Colors.blue,
                                labelColor: Colors.black,
                                tabs: [
                                  Tab(text: "Up next"),
                                  Tab(text: "Related QBank"),
                                  Tab(text: "Ask Query"),
                                ],
                              ),
                              Container(
                                height: 300, // Adjust based on content
                                child: TabBarView(
                                  children: [
                                    // ListView for "Up Next" items
                                    Builder(
                                      builder: (context) {

                                        var videolist = widget.listOfVideoModel;
                                            // videoController.recommendedVideoList;

                                        // videolist.removeWhere((element) => element.videoId == videoController.selectedVideoModel!.videoId);


                                        return ListView.builder(
                                          itemCount: videolist.length,
                                          itemBuilder: (context, index) {



                                            return videolist[index].videoId  == videoController.selectedVideoModel!.videoId ?SizedBox.shrink() :  buildQBankItem(videolist[index], index,videolist,onVideoClick: (){
                                              setState(() {

                                                _videoPlayerController = VideoPlayerController.network(
                                                  videolist[index].url ?? "",
                                                )..initialize().then((_) {
                                                  setState(() {});
                                                });
                                                _chewieController = ChewieController(
                                                  videoPlayerController: _videoPlayerController,
                                                  aspectRatio: 16 / 9,
                                                  autoPlay: false,
                                                  looping: false,
                                                );
                                              });
                                            });
                                              Card(
                                              child: ListTile(
                                                leading: CircleAvatar(
                                                  backgroundColor: Colors.grey[200],
                                                  child:
                                                      Text((index + 23).toString()),
                                                ),
                                                title: Text(
                                                  'Pulmonology Image Based Questions',
                                                  style: TextStyle(fontSize: 14),
                                                ),
                                                subtitle: Row(
                                                  children: [
                                                    Icon(Icons.star,
                                                        size: 16,
                                                        color: Colors.orange),
                                                    SizedBox(width: 4),
                                                    Text("4.5"),
                                                    SizedBox(width: 10),
                                                    Text("20 min"),
                                                  ],
                                                ),
                                                trailing:
                                                    Icon(Icons.arrow_forward_ios),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    ),
                                    // Placeholder for "Related QBank"
                                    Center(child: Text("Related QBank")),
                                    // Placeholder for "Ask Query"
                                    Center(child: Text("Ask Query")),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }

  // Function to open the bottom sheet
  void _openSubjectSelectionSheet(VideoModel videoModel) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: GetBuilder<VideoController>(
                  init: videoController,
                  builder: (videoController) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'Mark Video Complete',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Please share your rating for this video',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RatingBar.builder(
                          initialRating: rating.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (ratingValue) {
                            setState(() {
                              rating = ratingValue.toInt();
                            });
                            print(rating);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: reviewController,
                          maxLines: 4, // Multiline input
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your detailed feedback',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                            alignLabelWithHint:
                                true, // Aligns the hint with multiline input
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (videoController.videoloading)
                          CircularProgressIndicator(),
                        if (!videoController.videoloading)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  child: Text("Cancel")),
                              ElevatedButton(
                                  onPressed: () async {
                                    await videoController.sendVideoReview(
                                        videoModel,
                                        rating,
                                        reviewController.text);

                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kdeepblue,
                                      foregroundColor: Colors.white),
                                  child: Text("Submit")),
                            ],
                          )
                      ],
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
