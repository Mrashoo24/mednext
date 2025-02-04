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

import '../qbanks/allQuizTabs.dart';


class QBank extends StatefulWidget {
  const QBank({Key? key}) : super(key: key);

  @override
  State<QBank> createState() => _QBankState();


}


class _QBankState extends State<QBank> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
    super.initState();
    // Initialize TabController with 3 tabs
    _tabController = TabController(length: 3, vsync: this);
  }

  void dispose() {
    // Dispose TabController when the page is closed
    _tabController.dispose();
    super.dispose();
  }

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

          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for videos, Qbanks',
                    prefixIcon: Icon(Icons.search, color: klightGrey,),
                    // Search icon
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: klightGrey,), // Border color when focused
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: klightGrey,), // Default border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: klightGrey, width: 1), // Border when focused
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 8, horizontal: 8),
                    filled: true,
                    fillColor: Colors
                        .grey[100], // Background color for the search bar
                  ),
                ),
              ),
              Icon(Icons.check_circle, color: kbabyblue, size: 30,),
              Text("Past year Ques", style: TextStyle(fontSize: 14),),
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

          Get.to(AllQuizScreen());
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
