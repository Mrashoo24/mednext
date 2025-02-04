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

import '../../data/models/videoModel.dart';
import '../../video/pdfViewScreen.dart';

class NotesTopic extends StatefulWidget {
  const NotesTopic({super.key});

  @override
  State<NotesTopic> createState() => _NotesTopicState();
}

class _NotesTopicState extends State<NotesTopic> {
  TopicModel? selectedTopic;
  List<VideoModel> videoOfSubject = [];
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
        init: categoryController,
        builder: (controller) {
          videoOfSubject = videoController.videos
              .where((element) =>
                  element.subjectId == controller.selectedSubject!.subjectId)
              .toList();

          return Scaffold(
            appBar: AppBar(
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
                            "${controller.selectedSubject?.subjectName ?? ""}",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kdarkgrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // TabBarView
            body: _buildAllTab(0),
          );
        });
  }

  // Build the content for each tab
  Widget _buildAllTab(int tabIndex) {
    var topics = categoryController.topics
        .where((element) =>
            element.subjectId == categoryController.selectedSubject!.subjectId)
        .toList();

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
    var videoList = videoOfSubject
        .where((element) => element.topicId == topicModel.id)
        .toList();

    switch (tabIndex) {
      case 1:
        videoList =
            videoList.where((element) => !isPaidVideo(element)).toList();
        break;
      case 2:
        videoList = videoList.where((element) {
          return isNEwVideo(element);
        }).toList();
        break;
      default:
        videoList = videoList;
        break;
    }

    var noteList =
        videoList.where((element) => element.notes_pdf != null).toList();

    return noteList.isEmpty
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
                  itemCount: noteList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var model = noteList[index];

                    return InkWell(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        var file = await videoController
                            .createFileOfPdfUrl(model.notes_pdf ?? "");

                        Get.to(PDFScreen(
                          path: file.path.toString() ?? "",
                          title: videoController.selectedVideoModel!.title,
                        ));
                        setState(() {
                          loading = false;
                        });

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 16),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20.0),
                                              child: Text(
                                                model is VideoModel
                                                    ? model.title.toString()
                                                    : (model as QuizModel)
                                                        .title
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      loading ? Center(child: CircularProgressIndicator(),) :   Icon(CupertinoIcons.arrow_right_circle_fill)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
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
