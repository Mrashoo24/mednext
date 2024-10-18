import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mednextnew/Auth/Controller/categoryController.dart';
import 'package:mednextnew/data/models/subjectModel.dart';

import '../../constants/colors.dart';

class RecommendedVideos extends StatefulWidget {
  const RecommendedVideos({super.key});

  @override
  State<RecommendedVideos> createState() => _RecommendedVideosState();
}

class _RecommendedVideosState extends State<RecommendedVideos> {

  var controller = Get.put(CategoryController());

  SubjectModel? selectedSubject ;


  @override
  void initState() {
  selectedSubject = (controller.subjects.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: controller,
      builder: (controller) {

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Good Morning Parul!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    _openSubjectSelectionSheet(controller.subjects);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: kdeepblue.withOpacity(0.12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // Ensures the button is as wide as its content
                    children: [
                      Text(
                        selectedSubject?.subjectName ?? (controller.subjects.first.subjectName ?? ""),
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: kblack),
                      ),
                      SizedBox(width: 8), // Space between text and icon
                      Icon(Icons.keyboard_arrow_down,color: kblack,),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white, // You might want to set a background color
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    blurRadius: 4.0, // How blurry the shadow is
                    spreadRadius: 0.0, // How much the shadow spreads
                    offset: Offset(0, 5), // Position of the shadow (x, y)
                  ),
                ],
              ),
              margin: EdgeInsets.all(16.0),
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
                          child: ClipRRect(
                            child: Image.asset(
                              "asset/Logo med 1.png",
                              fit: BoxFit.fill,
                            ),
                          ),
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
                                  Text(
                                    'Dr Soumen Manna ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: kpurple,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Homeostasis',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: kblack,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Ratings",style: TextStyle(color: kgrey,fontSize: 12),),
                                    Row(
                                      children: [
                                        Text('4.5',style: TextStyle(fontSize: 12),),
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
                            ],
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
          ],
        );
      },
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
                groupValue: selectedSubject?.subjectId ??"",
                onChanged: (String? value) {
                  setState(() {
                    selectedSubject = subjects.firstWhere((element) => (value ?? "") == element.subjectId);
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
