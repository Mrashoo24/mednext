import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mednextnew/constants/colors.dart';

import '../../Auth/Controller/categoryController.dart';
import '../../Medicalcoursechoice/allVideoTab.dart';
import '../../constants/global.dart';
import '../SubVideoSection/free_video.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();


}


class _TeacherScreenState extends State<TeacherScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  void initState() {

    super.initState();
    // Initialize TabController with 3 tabs
    _tabController = TabController(length: 3, vsync:  this);
  }
  void dispose() {
    // Dispose TabController when the page is closed
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title: SearchWidget(
        hinText: "Search for videos, QBank",
        onChanged: (value) {},
    ),
    centerTitle: true,
    actions: [
    // IconButton(
    // icon: Icon(Icons.format_list_bulleted),
    // onPressed: () {
    // _openSubjectSelectionSheet(controller.topics);
    // },
    // ),
    ],),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Text(categoryController.selectedSubject!.subjectName.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<CategoryController>(
                  init: categoryController,
                  builder: (controller) {

                    var teacherList = controller.getTeachersBySubject(categoryController.selectedSubject!.subjectId.toString());

                    return  ListView.builder(
                        itemCount: teacherList.length,
                        itemBuilder: (context,index) {
                          return teacherCard(subjectModel: categoryController.selectedSubject!,teacherModel:teacherList[index]);
                        }
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
