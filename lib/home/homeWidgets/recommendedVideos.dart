import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mednextnew/Auth/Controller/AuthController.dart';
import 'package:mednextnew/Auth/Controller/categoryController.dart';
import 'package:mednextnew/Auth/Controller/videoController.dart';
import 'package:mednextnew/constants/global.dart';
import 'package:mednextnew/data/models/subjectModel.dart';
import 'package:mednextnew/data/models/videoModel.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/colors.dart';

class RecommendedVideos extends StatefulWidget {
  const RecommendedVideos({super.key});

  @override
  State<RecommendedVideos> createState() => _RecommendedVideosState();
}

class _RecommendedVideosState extends State<RecommendedVideos> {

  SubjectModel? selectedSubject;

  @override
  void initState() {
    if (!(categoryController.categories.isEmpty ||
        categoryController.courses.isEmpty ||
        categoryController.subjects.isEmpty)) {
      selectedSubject = (categoryController.subjects.first);
      videoController.loadCachedData();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: categoryController,
      builder: (controller) {
        return controller.categories.isEmpty ||
                controller.courses.isEmpty ||
                controller.subjects.isEmpty
            ? _buildShimmerEffect()
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good Morning ${authController.userData?.fullName}!',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Today, let’s discuss on important topic',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: klightGrey),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () {
                              _openSubjectSelectionSheet(controller.subjects);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: kdeepblue.withOpacity(0.12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              // Ensures the button is as wide as its content
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Text(
                                    selectedSubject?.subjectName ??
                                        (controller
                                                .subjects.first.subjectName ??
                                            ""),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: kblack),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                    width: 8), // Space between text and icon
                                Flexible(
                                    flex: 1,
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: kblack,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<VideoController>(
                      builder: (videoController) {

                        var currentVideo = videoController.getRecommendedVideoForSubject(selectedSubject?.subjectId ?? "").firstOrNull;

                    return videoThumnailCard(currentVideo);
                  }),
                ],
              );
      },
    );
  }



  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    color: Colors.grey[300],
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 12,
                              color: Colors.grey[300],
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: 60,
                              height: 12,
                              color: Colors.grey[300],
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 50,
                                height: 12,
                                color: Colors.grey[300],
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: 30,
                                height: 12,
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                        ),
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
  }

  // Function to open the bottom sheet
  void _openSubjectSelectionSheet(List<SubjectModel> subjects) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Select a Subject',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            // List of subjects with radio buttons
            for (var subject in subjects)
              RadioListTile<String>(
                title: Text(subject.subjectName ?? ""),
                value: subject.subjectId ?? "",
                groupValue: selectedSubject?.subjectId ?? "",
                onChanged: (String? value) {
                  setState(() {
                    selectedSubject = subjects.firstWhere(
                        (element) => (value ?? "") == element.subjectId);
                  });
                  Navigator.pop(
                      context); // Close the bottom sheet when selected
                },
              ),
            SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
