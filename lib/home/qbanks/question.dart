import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mednextnew/Auth/Controller/categoryController.dart';
import 'package:mednextnew/home/qbanks/qbankanalysis.dart';

import '../../constants/colors.dart';
import '../../constants/global.dart';
import '../../data/models/quizmodel.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  Color _borderColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('QBank'),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.format_list_bulleted),
          //     onPressed: () {
          //       // _openSubjectSelectionSheet(controller.topics);
          //     },
          //   ),
          // ],
        ),
        body: GetBuilder<CategoryController>(
            init: categoryController,
            builder: (cateController) {
              var currentQuestion = cateController.selectedQuizModel!
                  .questionsList![cateController.selectedQuestionIndex ?? 0];

              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ques ${((cateController.selectedQuestionIndex ?? 0) + 1)} of ${cateController.selectedQuizModel!.questionsList!.length}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.pause_circle_outline_rounded),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  //Icon(Icons.sort_by_alpha),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          currentQuestion.questionText ?? "",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     children: [
                  //
                  //       Text('20 Questions • Attempted on 26th Aug 2021, 09:00AM',style: TextStyle(),),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: Get.height*0.1,),
                  ...currentQuestion.options!.map((e) => questionCards(
                      currentQuestion, e.toString(), categoryController)),
                ],
              );
            }),
      ),
    );
  }

  GestureDetector questionCards(
      Question question, option, CategoryController categoryController) {
    return GestureDetector(
      onTap: () {
        categoryController.onAnswerTap(question, option.toString());
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: (question.correctAnswer == option &&
                        categoryController.selectedAnswer != null)
                    ? Colors.green
                    : (categoryController.selectedAnswerisCorrect == false &&
                            categoryController.selectedAnswer == option &&
                            categoryController.selectedAnswer != null)
                        ? Colors.red
                        : _borderColor),
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: (question.correctAnswer == option &&
                      categoryController.selectedAnswer != null)
                      ? Colors.green
                      : (categoryController.selectedAnswerisCorrect == false &&
                      categoryController.selectedAnswer == option &&
                      categoryController.selectedAnswer != null)
                      ? Colors.red
                      : Colors.grey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '${ indexToAlpha(question.options!.indexOf(option))}',
                    style: TextStyle(
                      fontSize: 12,
                      color:(question.correctAnswer == option &&
                          categoryController.selectedAnswer != null)
                          ? Colors.white
                          : (categoryController.selectedAnswerisCorrect == false &&
                          categoryController.selectedAnswer == option &&
                          categoryController.selectedAnswer != null)
                          ?  Colors.white
                          : Colors.grey
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                option.toString(),
                style: TextStyle(
                  fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: (question.correctAnswer == option &&
                            categoryController.selectedAnswer != null)
                        ? Colors.green
                        : (categoryController.selectedAnswerisCorrect ==
                                    false &&
                                categoryController.selectedAnswer == option &&
                                categoryController.selectedAnswer != null)
                            ? Colors.red
                            : _borderColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

String indexToAlpha(int index) {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';


    return letters[index];
  }
}
