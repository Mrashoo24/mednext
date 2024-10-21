import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mednextnew/Auth/Controller/categoryController.dart';
import 'package:mednextnew/Auth/Controller/videoController.dart';
import 'package:mednextnew/constants/global.dart';

import '../../constants/colors.dart';
import '../../data/models/subjectModel.dart';

class SubjectVideoWidgetFull extends StatefulWidget {
  const SubjectVideoWidgetFull({super.key});

  @override
  State<SubjectVideoWidgetFull> createState() => _SubjectVideoWidgetFullState();
}

class _SubjectVideoWidgetFullState extends State<SubjectVideoWidgetFull> {
  SubjectModel? selectedSubject;

  List<SubjectModel> subjectList = [];

  @override
  void initState() {
    setState(() {
      subjectList = categoryController.subjects;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return GetBuilder<CategoryController>(
        init: categoryController,
        builder: (categoryController) {
          return GetBuilder<VideoController>(
              init: videoController,
              builder: (videoController) {

                var videoList = selectedSubject == null ? videoController.videos : videoController.getVideosForSubject(selectedSubject!.subjectId.toString());

                return Scaffold(
                  appBar: AppBar(title: Text("My Subjects"),centerTitle: true,),
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20,),
                      SizedBox(
                        // Define a specific height for the ListView.builder
                        height: 40, // Set the height for your ListView
                        child: ListView.builder(
                          itemCount: subjectList.length + 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedSubject = null;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10,left: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 18),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: (selectedSubject == null) ? kdeepblue :Colors.transparent
                                      ),
                                      color: klightblue),
                                  child: Center(
                                      child: Text(
                                        'All Subjects',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,color: (selectedSubject == null) ? kdeepblue :kgrey ),
                                      )),
                                ),
                              );
                            }
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedSubject = subjectList[index - 1];
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: (selectedSubject == null && index == 0) ? kdeepblue :
                                    (selectedSubject == subjectList[index - 1]) ? kdeepblue : Colors.transparent
                                    ),
                                    color: klightblue),
                                child: Center(
                                    child: Text(
                                      subjectList[index - 1]
                                          .subjectName
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,color:(selectedSubject == null && index == 0) ? kdeepblue :
                                      (selectedSubject == subjectList[index - 1]) ? kdeepblue : kgrey
                                      ),
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      ListView.builder(
                        itemCount:  videoList.length ,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {

                          return videoThumnailCard(videoList[index],teacherProfilePic: "s");
                        },
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
