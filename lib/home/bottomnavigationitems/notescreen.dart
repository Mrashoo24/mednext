import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mednextnew/constants/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mednextnew/Auth/Controller/categoryController.dart';
import 'package:mednextnew/constants/global.dart';
import 'package:mednextnew/data/models/subjectModel.dart';
import 'package:mednextnew/home/SubVideoSection/teacherScreen.dart';
import 'package:mednextnew/home/bottomnavigationitems/notesTopics.dart';

import '../qbanks/allQuizTabs.dart';


class NotesSubjectScreen extends StatefulWidget {
  const NotesSubjectScreen({Key? key}) : super(key: key);

  @override
  State<NotesSubjectScreen> createState() => _NotesSubjectScreenState();


}


class _NotesSubjectScreenState extends State<NotesSubjectScreen> with SingleTickerProviderStateMixin {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CategoryController>(
          builder: (categoryController) {

            if(categoryController.courseloading) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }


            return Scaffold(
              appBar: AppBar(
                title: Text("Subjects"),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: GetBuilder<CategoryController>(
                        init: categoryController,
                        builder: (controller) {
                          var subjectList = controller.getSubjectsByCourse();

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, top: 20),
                                child: Row(
                                  children: [
                                    Text("Choose Subjects",
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: subjectList.length,
                                    itemBuilder: (context, index) {
                                      return subjectCard(subjectList[index],controller);
                                    }
                                ),
                              ),

                            ],
                          );
                        }),
                  ),

                ],
              ),
            );
          }),
    );
  }

  Padding subjectCard(SubjectModel subjectModel, CategoryController controller) {

    var currentQuizList = controller.quiz.where((e)=> e.subjectId == subjectModel.subjectId).toList();
    var completedQuizList = controller.completedQuiz.where((e)=> e.subjectId == subjectModel.subjectId).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
      child: InkWell(
        onTap: () {
          categoryController.selectedSubject = subjectModel;

          Get.to(NotesTopic());
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
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    Text("${completedQuizList.length}/${currentQuizList.length} Completed",
                        style: TextStyle(
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
