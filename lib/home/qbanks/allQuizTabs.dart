import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:mednextnew/Auth/Controller/categoryController.dart';
import 'package:mednextnew/constants/colors.dart';
import 'package:mednextnew/constants/global.dart';
import 'package:mednextnew/data/models/quizmodel.dart';
import 'package:mednextnew/data/models/topicModel.dart';
import 'package:mednextnew/video/videoplayerScreen.dart';

class AllQuizScreen extends StatefulWidget {
  const AllQuizScreen({super.key});

  @override
  State<AllQuizScreen> createState() => _AllQuizScreenState();
}

class _AllQuizScreenState extends State<AllQuizScreen> {
  TopicModel? selectedTopic;
  List<QuizModel> quizOfSubject = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: GetBuilder<CategoryController>(
          init: categoryController,
          builder: (controller) {
            quizOfSubject =   controller.quiz
                .where((element) =>
            element.subjectId == controller.selectedSubject!.subjectId)
                .toList();

            return Scaffold(
              appBar: AppBar(
                title: SearchWidget(
                  hinText: "Search for QBank",
                  onChanged: (value) {},
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.format_list_bulleted),
                    onPressed: () {
                      _openSubjectSelectionSheet(controller.topics);
                    },
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(100.0),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(bottom: 16.0, left: 16, top: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "${controller.selectedSubject?.subjectName ?? ""} . ${quizOfSubject.fold(0, (sum, q) => sum + (q.questionsList?.length ?? 0))} QBanks",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: kdarkgrey),
                            ),
                          ],
                        ),
                        // TabBar
                        TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.blue,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          tabAlignment: TabAlignment.start,
                          tabs: [
                            Tab(text: "All"),
                            Tab(text: "Free"),
                            Tab(text: "New"),
                            // Tab(text: "QBanks"),
                            // Tab(text: "Test(6)"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // TabBarView
              body: TabBarView(
                children: [
                  _buildAllTab(0), // All tab content

                  _buildAllTab(1), // Free tab content
                  _buildAllTab(2), // New tab content
                  // _buildFreeTab(2), // QBanks tab content
                  // _buildFreeTab(3), // Test tab content
                ],
              ),
            );
          }),
    );
  }

  // Build the content for each tab
  Widget _buildAllTab(int tabIndex) {
    var topics = categoryController.topics.where((element) => element.subjectId == categoryController.selectedSubject!.subjectId).toList();

    if (selectedTopic != null) {
      topics =
          topics.where((element) => element.id == selectedTopic!.id).toList();
    }

    return ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          var currentTopic = topics[index];

          return _buildSection(currentTopic, tabIndex);
        });
  }

  // Free Tab Content (you can add your own logic to filter free content)
  Widget _buildFreeTab() {
    return Center(
      child: Text('Free Content'),
    );
  }

  // New Tab Content (you can add your own logic for new content)
  Widget _buildNewTab() {
    return Center(
      child: Text('New Content'),
    );
  }

  // QBanks Tab Content
  Widget _buildQBanksTab() {
    return Center(
      child: Text('QBanks Content'),
    );
  }

  // Test Tab Content
  Widget _buildTestTab() {
    return Center(
      child: Text('Test Content (6)'),
    );
  }

  // Build section title
  Widget _buildSection(TopicModel topicModel, int tabIndex) {
    var quizList =  quizOfSubject
        .where((element) => element.topicId == topicModel.id)
        .toList();

    switch (tabIndex) {
      case 1:
        quizList =
            quizList.where((element) => !isPaidQuiz(element)).toList();
        break;
      case 2:
        quizList = quizList.where((element) {
          return isNEwQuiz(element);
        }).toList();
        break;
      default:
        quizList = quizList;
        break;
    }

    return quizList.isEmpty
        ? SizedBox.shrink()
        : Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            topicModel.name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kgrey,
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: quizList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return buildQBankItem(quizList[index], index,quizList);
            },
          ),
        )
      ],
    );
  }



  // Function to open the bottom sheet
  void _openSubjectSelectionSheet(List<TopicModel> topics) {
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
                'Select a Topic',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            // List of subjects with radio buttons
            for (var subject in topics)
              RadioListTile<String>(
                title: Text(subject.name ?? ""),
                value: subject.id ?? "",
                groupValue: selectedTopic?.id ?? "",
                onChanged: (String? value) {
                  setState(() {
                    selectedTopic = topics
                        .firstWhere((element) => (value ?? "") == element.id);
                  });
                  Navigator.pop(
                      context); // Close the bottom sheet when selected
                },
              ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedTopic = null;
                  });
                  Navigator.pop(context);
                },
                child: Text("Clear Filters"))
          ],
        );
      },
    );
  }

}

class SearchWidget extends StatelessWidget {
  final String? hinText;
  final void Function(String)? onChanged;

  const SearchWidget({
    super.key,
    this.hinText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hinText,
          prefixIcon: Icon(
            Icons.search,
            color: klightGrey,
            size: 30,
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 40, maxHeight: 25),
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          hintStyle: TextStyle(
              color: klightGrey, fontSize: 14, fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kgrey.withOpacity(0.3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kgrey.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kgrey.withOpacity(0.3)),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
