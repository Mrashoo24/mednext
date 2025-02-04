import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:mednextnew/Auth/Controller/updatesController.dart';
import 'package:mednextnew/data/models/quizmodel.dart';
import 'package:mednextnew/data/models/subjectModel.dart';
import 'package:mednextnew/data/models/usermodel.dart';
import 'package:mednextnew/video/videoplayerScreen.dart';

import '../Auth/Controller/AuthController.dart';
import '../Auth/Controller/categoryController.dart';
import '../Auth/Controller/videoController.dart';
import '../Medicalcoursechoice/allVideoTab.dart';
import '../data/models/videoModel.dart';
import '../home/homeWidgets/subjectVideoWidget.dart';
import '../home/qbanks/question.dart';
import '../video/singleVideoPlayer.dart';
import 'colors.dart';

AuthController authController = Get.put(AuthController());
final GetStorage box = GetStorage();
var categoryController = Get.put(CategoryController());
VideoController videoController = Get.put(VideoController());
UpdatesController updatesController = Get.put(UpdatesController());

Widget videoThumnailCard(VideoModel? currentVideo, {bool? teacherProfilePic}) {
  return currentVideo == null
      ? SizedBox()
      : Builder(builder: (context) {
          UserModel? teacher =
              categoryController.getTeacherById(currentVideo.teacherId ?? "");

          return teacher == null
              ? SizedBox()
              : InkWell(
                  onTap: () {
                    videoController.selectedVideoModel = currentVideo;
                    videoController.update();
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
                              if (!(teacherProfilePic ?? false))
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
                              if (teacherProfilePic ?? false)
                                CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                    teacher!.photoUrl.toString(),
                                  ),
                                ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 10,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  teacher!.fullName.toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: kpurple,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  currentVideo.title ?? "",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: kblack,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 5,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Ratings",
                                                  style: TextStyle(
                                                      color: kgrey,
                                                      fontSize: 12),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      currentVideo.ratings
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Wrap(
                                      alignment: WrapAlignment.spaceBetween,
                                      children: [
                                        buildIconRow(
                                            "${currentVideo.duration} Min",
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
        });
}

Widget teacherAndSubjectCard({required VideoModel videoModel}) {
  var teacherModel =
      categoryController.getTeacherById(videoModel.teacherId ?? "");

  var subjectModel =
      categoryController.getSubjectsById(videoModel.subjectId ?? "");

  var videoSubjectAndTeacher = videoController.videos
      .where((element) =>
          (element.teacherId == videoModel.teacherId) &&
          (element.subjectId == videoModel.subjectId))
      .toList();

  return Builder(builder: (context) {
    UserModel? teacher =
        categoryController.getTeacherById(teacherModel?.userId ?? "");

    return teacher == null
        ? SizedBox()
        : InkWell(
            onTap: () {
              categoryController.selectedSubject = subjectModel;
              categoryController.selectedTeacher = teacherModel;

              categoryController.update();

              Get.to(AllVideosScreen());
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
                        CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 35,
                          backgroundImage: NetworkImage(
                            teacher!.photoUrl.toString(),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        teacher!.fullName.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: kpurple,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        subjectModel?.subjectName ?? "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: kblack,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: klightGrey,
                                    size: 20,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      buildIconRow(
                                          "${videoSubjectAndTeacher.length} Videos",
                                          Icons.access_alarm),
                                      // buildIconRow("${currentVideo.duration} Students",Icons.video_call_outlined),
                                      // buildIconRow("7836 Students",Icons.access_alarm)
                                    ],
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "5",
                                          // currentVideo.ratings.toString(),
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: kyellow,
                                          size: 12,
                                        ),
                                      ],
                                    ),
                                  ),
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
  });
}

Widget teacherCard(
    {required SubjectModel subjectModel, required UserModel teacherModel}) {
  var videoSubjectAndTeacher = videoController.videos
      .where((element) =>
          (element.teacherId == teacherModel.userId) &&
          (element.subjectId == subjectModel.subjectId))
      .toList();

  return Builder(builder: (context) {
    UserModel? teacher =
        categoryController.getTeacherById(teacherModel?.userId ?? "");

    return teacher == null
        ? SizedBox()
        : InkWell(
            onTap: () {
              categoryController.selectedSubject = subjectModel;
              categoryController.selectedTeacher = teacherModel;

              categoryController.update();

              Get.to(AllVideosScreen());
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
                        CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 35,
                          backgroundImage: NetworkImage(
                            teacher!.photoUrl.toString(),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        teacher!.fullName.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: kblack,
                                        ),
                                      ),
                                      Text(
                                        subjectModel?.subjectName ?? "",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: kpurple,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: klightGrey,
                                    size: 20,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      buildIconRow(
                                          "${videoSubjectAndTeacher.length} Videos",
                                          Icons.access_alarm),
                                      // buildIconRow("${currentVideo.duration} Students",Icons.video_call_outlined),
                                      // buildIconRow("7836 Students",Icons.access_alarm)
                                    ],
                                  ),
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
  });
}

Widget quizCard(QuizModel currentQui) {
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
                        currentQui
                        .title ?? "",
                        style: TextStyle(
                          fontSize: 14,
                          color: kblack,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: Colors.amber, size: 14),
                          Text(
                            currentQui.ratings.toString(),
                            style: TextStyle(
                                fontSize: 12, color: klightGrey),
                          ),
                          SizedBox(width: 8),
                          Text(
                               "• ${currentQui.questionsList!.length.toString()} questions",
                              style: TextStyle(
                                  fontSize: 12, color: klightGrey)),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Text(
                          categoryController.getSubjectsById(currentQui.subjectId ??"")!.subjectName ?? "",
                          style: TextStyle(fontSize: 12, color: kskyblue),
                        ),
                        decoration: BoxDecoration(
                            color: khighlighBlue.withOpacity(0.14),
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          // Handle navigation for QuizModel if needed
                          categoryController.selectedQuiz(currentQui);
                          var result = await categoryController.currentActiveQuestion();

                          if(!result) {
                            Get.to(Questions());
                          }else{
                            Get.snackbar("This Quiz is Completed", "You have already completed this quiz",backgroundColor: Colors.red,colorText: Colors.white,snackPosition: SnackPosition.BOTTOM);
                          }

                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          child: Text(
                            "Start Quizzes",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          decoration: BoxDecoration(
                              color: kdeepblue,
                              borderRadius: BorderRadius.circular(7)),
                        ),
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

Widget recentUpdateComponent() {
  return GetBuilder<UpdatesController>(
      init: updatesController,
      builder: (controller) {
        return controller.listOfUpdates.isEmpty
            ? SizedBox()
            : Builder(builder: (context) {
                var recentUpdate = controller.listOfUpdates.first;

                return Container(
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
                    child: Row(
                      children: [
                        Image.asset("asset/alarmicon.png"),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recent Updates",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: kblack),
                            ),
                            Text(
                              "Updated on ${recentUpdate.uploadDate}",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: kgrey),
                            ),
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
              });
      });
}

Widget videoOfTheDayComponent(
    String img, String title, String subtitle, String link) {
  return GetBuilder<UpdatesController>(
      init: updatesController,
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            Get.to(SingleVideoPlayerScreen(videoUrl: link,title: title,)); // Navigating to the link
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.assetNetwork(
                              placeholder:
                                  'asset/female.png', // Placeholder image
                              image: img,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kblack),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                subtitle,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: kpurple),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset("asset/rigthArrow.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}


Widget buildQBankItem<T>(
    T model, int index, List<T> modelList,
    {void Function()? onItemClick}) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      var width = constraints.maxWidth;
      var height = constraints.maxHeight;

      return Stack(
        children: [
          InkWell(
            onTap: () async {
              if (model is VideoModel) {
                videoController.selectedVideoModel = model;
                if (onItemClick == null) {
                  videoController.recommendedVideoList = modelList.cast<VideoModel>();
                }
                videoController.update();
              } else if (model is QuizModel) {
                categoryController.selectedQuizModel = model;
                // if (onItemClick == null) {
                //   categoryController.recommendedVideoList = modelList.cast<VideoModel>();
                // }
                categoryController.update();
              }

              if (onItemClick != null) {
                onItemClick();
              } else {
                if (model is VideoModel) {
                  Get.to(VideoPlayerScreen(
                    listOfVideoModel: modelList.cast<VideoModel>(),
                  ));
                }else  if (model is QuizModel){
                  // Handle navigation for QuizModel if needed
                  categoryController.selectedQuiz(model);
                  var result = await categoryController.currentActiveQuestion();

                 if(!result) {
                    Get.to(Questions());
                  }else{
                   Get.snackbar("This Quiz is Completed", "You have already completed this quiz",backgroundColor: Colors.red,colorText: Colors.white,snackPosition: SnackPosition.BOTTOM);
                 }
                }
              }
            },
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                          child: Text("${index + 1}",
                              style: TextStyle(color: Colors.black))),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      model is VideoModel
                                          ? model.title.toString()
                                          : (model as QuizModel).title.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 14),
                                      Text(
                                        model is VideoModel
                                            ? model.ratings.toString()
                                            : (model as QuizModel).ratings.toString(),
                                        style: TextStyle(
                                            fontSize: 12, color: klightGrey),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                          model is VideoModel
                                              ? "• ${model.duration.toString()} min"
                                              : "• ${(model as QuizModel).questionsList!.length.toString()} questions",
                                          style: TextStyle(
                                              fontSize: 12, color: klightGrey)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (model is VideoModel && isPaidVideo(model))
                              Image.asset("asset/lock.png"),
                            if (model is QuizModel && isPaidQuiz(model))
                              Image.asset("asset/lock.png"),
                            if (model is VideoModel && !isPaidVideo(model))
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: klightGrey,
                              ),
                            if (model is QuizModel && !isPaidQuiz(model))
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: klightGrey,
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (model is VideoModel && isNEwVideo(model))
            Positioned(
              left: width * 0.15,
              top: width * 0.01,
              child: CircleAvatar(
                backgroundColor: Color(0xFF1AE316),
                radius: 5,
              ),
            ),
          if (model is QuizModel && isNEwQuiz(model))
            Positioned(
              left: width * 0.15,
              top: width * 0.01,
              child: CircleAvatar(
                backgroundColor: Color(0xFF1AE316),
                radius: 5,
              ),
            ),
        ],
      );
    },
  );
}

bool isPaidVideo(VideoModel element) => (element.paid ?? true);

bool isNEwVideo(VideoModel element) {
  return (DateTime.now()
          .difference(DateFormat("yyyy-MM-dd hh:mm:ss")
              .parse(element.uploadDate.toString()))
          .inDays <
      10);
}

bool isPaidQuiz(QuizModel element) => (element.paid ?? true);

bool isNEwQuiz(QuizModel element) {
  return (DateTime.now()
      .difference(DateFormat("yyyy-MM-dd hh:mm:ss")
      .parse(element.uploadDate.toString()))
      .inDays <
      10);
}
