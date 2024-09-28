import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mednextnew/Auth/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Medicalcoursechoice/courseselect.dart';
import '../../data/models/usermodel.dart';
import '../splach2.dart';

class AuthController extends GetxController {
  // Firebase Auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;

  // Function to handle sign-up
  Future<void> createAccount(GlobalKey<FormState> formKey, String email,
      String password, String fullName) async {
    if (formKey.currentState!.validate()) {
      loading = true;
      update();
      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );

        String userId = userCredential.user!.uid;

        UserModel userModel = UserModel(
          userId: userId,
          fullName: fullName,
          email: email,
        );

        // Save user data to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .set(userModel.toJson());

        // Save user data to SharedPreferences
        await saveUserData(userModel);
        loading = false;
        // update();
        // Navigate to the next page if successful
        Get.to(() => SelectyourCourse());
      } catch (e) {
        loading = false;
        update();
        // Handle errors (e.g., email already in use, weak password)
        String errorMessage;
        if (e is FirebaseAuthException) {
          if (e.code == 'email-already-in-use') {
            errorMessage = 'This email is already in use.';
          } else if (e.code == 'weak-password') {
            errorMessage = 'The password is too weak.';
          } else {
            errorMessage = 'An error occurred. Please try again.';
          }
        } else {
          errorMessage = 'An unknown error occurred.';
        }
        Get.snackbar('Error', errorMessage,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }


  Future<void> login(GlobalKey<FormState> formKey, String email, String password) async {
    if (formKey.currentState!.validate()) {
      loading = true;
      update();
      try {
        // Sign in using Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );

        String userId = userCredential.user!.uid;

        // Fetch user data from Firestore using userId
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();

        if (userDoc.exists) {
          // Convert Firestore document to UserModel
          UserModel userModel = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);

          // Save user data to SharedPreferences
          await saveUserData(userModel);

          // Navigate to the next page (home page or course selection)
          Get.offAll(() => SelectyourCourse());
        } else {
          loading = false;
          update();
          // If user data does not exist in Firestore, show an error
          Get.snackbar('Error', 'User data not found.',
              snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
        }
      } catch (e) {
        loading = false;
        update();
        // Handle errors (e.g., user not found, wrong password)
        String errorMessage;
        if (e is FirebaseAuthException) {
          if (e.code == 'user-not-found') {
            errorMessage = 'No user found for that email.';
          } else if (e.code == 'wrong-password') {
            errorMessage = 'Wrong password provided for that user.';
          } else {
            errorMessage = 'An error occurred. Please try again.';
          }
        } else {
          errorMessage = 'An unknown error occurred.';
        }

        Get.snackbar('Error', errorMessage,
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

// Save user data to SharedPreferences
  Future<void> saveUserData(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', user.userId ?? '');
    await prefs.setString('fullName', user.fullName ?? '');
    await prefs.setString('email', user.email ?? '');
  }

// Retrieve user data from SharedPreferences
  Future<UserModel?> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? fullName = prefs.getString('fullName');
    String? email = prefs.getString('email');

    if (userId != null && fullName != null && email != null) {
      return UserModel(
        userId: userId,
        fullName: fullName,
        email: email,
      );
    }
    return null; // Return null if no data is found
  }

  Future<void> checkUserLoggedIn() async {
    UserModel? user = await loadUserData();
    if (user != null) {
      // User data exists, navigate to the home screen or next page
      Get.offAll(() => SelectyourCourse());
    } else {
      // User data does not exist, navigate to the login screen
      Get.offAll(() => SplashTwo());
    }
  }
}
