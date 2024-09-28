

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/models/categorymodel.dart';





class CategoryController extends GetxController {
  var categories = <CategoryModel>[];

  var loading = false;

  @override
  void onInit() {
    super.onInit();

  }


  Future<void> getCategories() async {
    loading = true;
    update();

    try {
      // Fetch data from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('categories').get();

      // Map Firestore data to Category model
      categories = querySnapshot.docs.map((doc) => CategoryModel.fromJson(doc.data() as Map<String, dynamic>)).toList();

      update();
    } catch (e) {
      // Handle any errors
      print("Error fetching categories: $e");
    } finally {
      loading = false;
      update();

    }
  }

  // Example of using the copyWith method
  void updateCategory(int index, String newName) {
    if (index < 0 || index >= categories.length) return;
    var updatedCategory = categories[index].copyWith(name: newName);
    categories[index] = updatedCategory; // Update the category
  }

  getCourse() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('categories').get();
  }

}




