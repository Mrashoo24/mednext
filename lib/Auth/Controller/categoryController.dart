import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mednextnew/data/models/completedQuizModel.dart';
import 'package:mednextnew/data/models/coursemodel.dart';
import 'package:mednextnew/data/models/quizmodel.dart';
import 'package:mednextnew/data/models/subjectModel.dart';
import 'package:mednextnew/data/models/categorymodel.dart';
import 'package:mednextnew/data/models/topicModel.dart';
import 'package:mednextnew/data/models/usermodel.dart';
import 'package:mednextnew/home/qbanks/question.dart';

import '../../constants/global.dart';
import '../../home/qbanks/allQuizTabs.dart';

class CategoryController extends GetxController {
  var categories = <CategoryModel>[];
  var courses = <CourseModel>[];
  var subjects = <SubjectModel>[];
  var teachers = <UserModel>[];
  var topics = <TopicModel>[];
  var quiz = <QuizModel>[];

  var loading = false;
  var courseloading = false;
  var quizloading = false;

  var selectedCourseId = "";
  var selectedQQuestionId = "";

  SubjectModel? selectedSubject ;
  UserModel? selectedTeacher ;
  List<CompletedQuizModel> completedQuiz = [];
  QuizModel? selectedQuizModel ;
  Question? selectedQuestion;
  int? selectedQuestionIndex;

  bool? selectedAnswerisCorrect;
  String? selectedAnswer;

  // Load data from cache
  Future<void> loadCachedData() async {
    // Load categories from cache if available
    if (box.hasData('categories')) {
      var cachedCategories = box.read<List>('categories');
      categories = cachedCategories
          ?.map((category) => CategoryModel.fromJson(category))
          .toList() ??
          [];
      update();
       getCategories();
    }else{
        getCategories();
    }

    // Load courses from cache if available
    if (box.hasData('courses')) {
      var cachedCourses = box.read<List>('courses');
      courses = cachedCourses
          ?.map((course) => CourseModel.fromJson(course))
          .toList() ??
          [];
      update();
        getCourse();
    }else{
         getCourse();
    }

    // Load subjects from cache if available
    if (box.hasData('subjects')) {
      var cachedSubjects = box.read<List>('subjects');
      subjects = cachedSubjects
          ?.map((subject) => SubjectModel.fromJson(subject))
          .toList() ??
          [];
      update();
         getSubjects();
    }else{
         getSubjects();
    }

    if (box.hasData('topics')) {
      var cachedSubjects = box.read<List>('topics');
      topics = cachedSubjects
          ?.map((subject) => TopicModel.fromJson(subject))
          .toList() ??
          [];
      update();
      getTopic();
    }else{
      getTopic();
    }


    if (box.hasData('quiz')) {
      var cachedQuiz = box.read<List>('quiz');
      quiz = cachedQuiz
          ?.map((subject) => QuizModel.fromJson(subject))
          .toList() ??
          [];
      update();
      getQuiz();
    }else{
      getQuiz();
    }

    getAllCompletedQuiz();
  }




  // Fetch categories with caching logic
  Future<void> getCategories() async {
    // if (categories.isNotEmpty) {
    //   return; // Skip fetch if data is already cached
    // }

    if(categories.isEmpty){
      loading = true;
      update();
    }

    try {
      // Fetch data from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('categories').get();

      // Map Firestore data to Category model
      categories = querySnapshot.docs.map((doc) => CategoryModel.fromJson(doc.data() as Map<String, dynamic>)).toList();

      // Cache the fetched categories
      box.write('categories', categories.map((category) => category.toJson()).toList());

      update();
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      loading = false;
      update();
    }
  }

  // Fetch courses with caching logic
  Future<void> getCourse() async {
    // if (courses.isNotEmpty) {
    //   return; // Skip fetch if data is already cached
    // }

    if(courses.isEmpty){
      courseloading = true;
      update();
    }
    try {
      // Fetch data from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('course').get();

      // Map Firestore data to Course model
      courses = querySnapshot.docs.map((doc) => CourseModel.fromJson(doc.data() as Map<String, dynamic>)).toList();

      // Cache the fetched courses
      box.write('courses', courses.map((course) => course.toJson()).toList());

      update();
    } catch (e) {
      print("Error fetching courses: $e");
    } finally {
      courseloading = false;
      update();
    }
  }

  // Fetch subjects with caching logic
  Future<void> getSubjects() async {
    // if (subjects.isNotEmpty) {
    //   return; // Skip fetch if data is already cached
    // }

    if(subjects.isEmpty){
      courseloading = true;
      update();
    }
    try {
      // Fetch data from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('subjects').get();

      // Map Firestore data to Subject model
      subjects = querySnapshot.docs.map((doc) => SubjectModel.fromJson(doc.data() as Map<String, dynamic>)).toList();

      // Cache the fetched subjects
      box.write('subjects', subjects.map((subject) => subject.toJson()).toList());

      update();
    } catch (e) {
      print("Error fetching subjects: $e");
    } finally {
      courseloading = false;
      update();
    }
  }

  List<SubjectModel> getSubjectsByCourse()  {
     if (subjects.isNotEmpty) {
       return subjects.where((element) {
         var userCourse = authController.userData?.registeredCourses;

         return element.courseIds!.contains(userCourse!.first);


       }).toList();

     }else{
       return [];
     }
    
  }

  List<SubjectModel> getSubjectsByCourseId(String? courseId)  {
    if (subjects.isNotEmpty) {
      return subjects.where((element) {

        return element.courseIds!.contains(courseId);


      }).toList();

    }else{
      return [];
    }

  }

  SubjectModel? getSubjectsById(String id)  {
    if (subjects.isNotEmpty) {
      return subjects.firstWhere((element) {

        return element.subjectId! == id;


      });

    }else{
      return null;
    }

  }


  // Fetch subjects with caching logic
  Future<void> getTopic() async {
    // if (subjects.isNotEmpty) {
    //   return; // Skip fetch if data is already cached
    // }

    if(topics.isEmpty){
      courseloading = true;
      update();
    }
    try {
      // Fetch data from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('topics').get();

      // Map Firestore data to Subject model
      topics = querySnapshot.docs.map((doc) => TopicModel.fromJson(doc.data() as Map<String, dynamic>)).toList();

      // Cache the fetched subjects
      box.write('topics', topics.map((subject) => subject.toJson()).toList());

      update();
    } catch (e) {
      print("Error fetching subjects: $e");
    } finally {
      courseloading = false;
      update();
    }
  }

  TopicModel? getTopicById(String id)  {
    if (topics.isNotEmpty) {
      return topics.firstWhere((element) {

        return element.id! == id;


      });

    }else{
      return null;
    }

  }

  List<TopicModel> getTopicBySubject(String subjectId)  {
    if (topics.isNotEmpty) {
      return topics.where((element) {

        return element.subjectId == (subjectId);


      }).toList();

    }else{
      return [];
    }

  }



  Future<void> getTeachersByCourse() async {

    var year = authController.userData!.registeredCourses!;

    try {
      // Fetch data from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('teachers').get();

      // Map Firestore data to Course model
      teachers = querySnapshot.docs.map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>)).toList();

      teachers = teachers.where((element) => element.registeredCourses!.contains(year.first)).toList();

      update();
    } catch (e) {
      print("Error fetching courses: $e");
    }
  }


  List<UserModel> getTeachersBySubject(String subjectId)  {
    if (teachers.isNotEmpty) {
      return teachers.where((element) {

        return element.registeredSubjects!.contains(subjectId);


      }).toList();

    }else{
      return [];
    }

  }

  UserModel? getTeacherById(String teacherId)  {
    if (teachers.isNotEmpty) {
      return teachers.firstWhere((element) {

        return element.userId! == teacherId;


      });

    }else{
      return null;
    }

  }

  Future<void> getQuiz() async {
    // if (categories.isNotEmpty) {
    //   return; // Skip fetch if data is already cached
    // }

    if(categories.isEmpty){
      quizloading = true;
      update();
    }

    try {
      // Fetch data from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('quiz').get();

      // Map Firestore data to Category model
      quiz = querySnapshot.docs.map((doc) => QuizModel.fromJson(doc.data() as Map<String, dynamic>)).toList();

      // Cache the fetched categories
      box.write('quiz', quiz.map((quizD) => quizD.toJson()).toList());

      update();
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      quizloading = false;
      update();
    }
  }

  List<QuizModel> getQuizFromSubjectId(String? subjectId)  {
    if (quiz.isNotEmpty) {
      return quiz.where((element) {

        return element.subjectId!.toLowerCase().contains(subjectId.toString());


      }).toList();

    }else{
      return [];
    }

  }

  Future<void> getAllCompletedQuiz() async {

    try {
// Fetch data from Firestore
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('completedQuiz').where("uid",isEqualTo: authController.userData!.userId.toString()).get();

// Map Firestore data to Video model
      completedQuiz = querySnapshot.docs
          .map((doc) => CompletedQuizModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

// Cache the fetched videos

      update();
    } catch (e) {
      print("Error fetching completedQuiz: $e");
    } finally {

    }
  }

  Future<void> selectedQuiz(QuizModel quizModel) async {
    selectedQuizModel = quizModel;
    selectedAnswerisCorrect = null;
    selectedAnswer = null;
    update();
  }

  Future<bool> currentActiveQuestion() async {

    if (selectedQuizModel != null) {
      var completedQuizModel = completedQuiz.firstWhere(
            (quiz) => quiz.id == selectedQuizModel!.quizId,
        orElse: () => CompletedQuizModel(),
      );

      if (completedQuizModel.questionsList != null) {
       selectedQuestion = selectedQuizModel!.questionsList!.firstWhereOrNull(
               (q) => !completedQuizModel.questionsList!.map((e) => e.questionId).contains(q.questionId),);
       if (selectedQuestion == null) return true;
       selectedQuestionIndex = selectedQuizModel!.questionsList!.map((e) => e.questionId).toList().indexOf(selectedQuestion!.questionId);
      } else {
        selectedQuestion = selectedQuizModel!.questionsList!.first;
        selectedQuestionIndex = 0;
      }
    } else {
      selectedQuestion = null;

    }
    update();
    return false;
  }

  Future<void> addCompletedQuiz(CompletedQuizModel completedQuizModel) async {
    try {
      await FirebaseFirestore.instance.collection('completedQuiz').doc(completedQuizModel.id).set(completedQuizModel.toJson());
      completedQuiz.add(completedQuizModel);
      update();
    } catch (e) {
      print("Error adding completedQuiz: $e");
    }
  }

  Future<void> updateCompletedQuiz(CompletedQuizModel completedQuizModel) async {
    try {
      await FirebaseFirestore.instance.collection('completedQuiz').doc(completedQuizModel.id).update(completedQuizModel.toJson());
      var index = completedQuiz.indexWhere((quiz) => quiz.id == completedQuizModel.id);
      completedQuiz[index] = completedQuizModel;
      update();
    } catch (e) {
      print("Error updating completedQuiz: $e");
    }
  }

  Future<bool> onAnswerTap(Question question, String selectedAnswers) async {
    if (selectedQuizModel != null) {
      selectedAnswer = selectedAnswers;
      update()  ;
      var completedQuizModel = completedQuiz.firstWhere(
            (quiz) => quiz.id == selectedQuizModel!.quizId,
        orElse: () => CompletedQuizModel(),
      );

      bool isCorrect = question.correctAnswer == selectedAnswer;
        var present = false;
      if (completedQuizModel.questionsList != null) {
        present = true;
        var existingQuestion = completedQuizModel.questionsList!.firstWhere(
              (q) => q.questionId == question.questionId,
          orElse: () => Question(),
        );

        if (existingQuestion.questionId != null) {
          existingQuestion.selectedAnswer = selectedAnswer;
          existingQuestion.isCorrect = isCorrect;

          // completedQuizModel.questionsList![completedQuizModel.questionsList!.indexWhere((e) => e.questionId == existingQuestion.)].add(question);
        } else {
          question.selectedAnswer = selectedAnswer;
          question.isCorrect = isCorrect;
          completedQuizModel.questionsList!.add(question);
        }
      } else {
        present = false;
        completedQuizModel = CompletedQuizModel(
          courseId: selectedQuizModel!.courseId,
          date: DateTime.now().toString(),
          id: selectedQuizModel!.quizId,
          subjectId: selectedQuizModel!.subjectId,
          topicId: selectedQuizModel!.topicId,
          uid: authController.userData!.userId,
          teacherId: selectedQuizModel!.teacherId,
          rating: 0,
          review: "",
          videoId: selectedQuizModel!.videoId,
        );
        completedQuizModel.questionsList = [question];
      }
      selectedAnswerisCorrect = isCorrect;
      update();

      if (present) {
        await updateCompletedQuiz(completedQuizModel);
        await  Future.delayed(Duration(seconds: 2));
        selectedAnswer = null;
        var result =await currentActiveQuestion();
        if (result) {
          print("Quiz Completed");
          Get.snackbar("Quiz Completed", "You have completed the quiz",backgroundColor: Colors.green,colorText: Colors.white,);
          Get.off(AllQuizScreen());
        }

      } else {
        await addCompletedQuiz(completedQuizModel);
      await  Future.delayed(Duration(seconds: 2));
        selectedAnswer = null;
        var result =await currentActiveQuestion();
        if (result) {
          print("Quiz Completed");
          Get.snackbar("Quiz Completed", "You have completed the quiz",backgroundColor: Colors.green,colorText: Colors.white);
          Get.off(AllQuizScreen());

        }
      }
      return isCorrect;
    }
    return false;
  }



}
