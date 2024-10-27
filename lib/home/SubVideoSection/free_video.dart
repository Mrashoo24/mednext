import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mednextnew/Auth/Controller/categoryController.dart';
import 'package:mednextnew/constants/colors.dart';
import 'package:mednextnew/constants/global.dart';
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
    var width0;
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
