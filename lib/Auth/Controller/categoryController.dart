import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mednextnew/data/models/coursemodel.dart';
import 'package:mednextnew/data/models/subjectModel.dart';
import 'package:mednextnew/data/models/categorymodel.dart';

import '../../constants/global.dart';

class CategoryController extends GetxController {
  var categories = <CategoryModel>[];
  var courses = <CourseModel>[];
  var subjects = <SubjectModel>[];

  var loading = false;
  var courseloading = false;

  var selectedCourseId = "";
  var selectedQQuestionId = "";


  @override
  void onInit() {
    super.onInit();
    // Load cached data on initialization
    loadCachedData();
  }

  // Load data from cache
  void loadCachedData() {
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
}
