import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mednextnew/Auth/Controller/categoryController.dart';
import 'package:mednextnew/constants/colors.dart';
import 'package:mednextnew/constants/global.dart';
import 'package:mednextnew/data/models/quizmodel.dart';
import 'package:mednextnew/data/models/subjectModel.dart';
import 'package:mednextnew/home/SubVideoSection/teacherScreen.dart';

class FreeVideo extends StatefulWidget {
  const FreeVideo({Key? key}) : super(key: key);

  @override
  State<FreeVideo> createState() => _FreeVideoState();
}

class _FreeVideoState extends State<FreeVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CategoryController>(
          init: categoryController,
          builder: (controller) {

            var subjectList = controller.getSubjectsByCourse();

        return  Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Text("Choose Subjects",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: subjectList.length,
                itemBuilder: (context,index) {
                  return subjectCard(subjectList[index]);
                }
              ),
            ),

          ],
        );
      }),
    );
  }

  Padding subjectCard(SubjectModel subjectModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
      child: InkWell(
        onTap: (){
          // FirebaseFirestore.instance.collection("quiz").add({
          //   "courseId": "course123",
          //   "description": "Sample quiz description",
          //   "questions": 10,
          //   "ratings": 5,
          //   "subjectId": "subject123",
          //   "teacherId": "teacher123",
          //   "thumbnail": "http://example.com/thumbnail.jpg",
          //   "title": "Sample Quiz Title",
          //   "uploadDate": "2023-10-01",
          //   "url": "http://example.com/quiz",
          //   "videoId": "video123",
          //   "paid": false,
          //   "recommended": true,
          //   "topicId": "topic123",
          //   "totalRating": 4,
          //   "slides": ["slide1.pdf", "slide2.pdf"],
          //   "notes_pdf": "notes.pdf",
          //   "quizId": "quiz123",
          //   "questionsList": [
          //     {
          //       "questionId": "q1",
          //       "questionText": "What is 2 + 2?",
          //       "options": ["3", "4", "5", "6"],
          //       "correctAnswer": "4",
          //       "quizId": "quiz123"
          //     },
          //     {
          //       "questionId": "q2",
          //       "questionText": "What is the capital of France?",
          //       "options": ["Berlin", "Madrid", "Paris", "Rome"],
          //       "correctAnswer": "Paris",
          //       "quizId": "quiz123"
          //     }
          //   ]
          // });
          categoryController.selectedSubject = subjectModel;

          Get.to(TeacherScreen());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                Icon(Icons.heart_broken),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(subjectModel.subjectName ?? "",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),

                    Text("${subjectModel.totalStudents} students Learning", style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 10)),

                  ],
                ),
              ],
            ),

            Icon(Icons.chevron_right, color: kblack, size: 30,)
          ],
        ),
      ),
    );
  }
}
