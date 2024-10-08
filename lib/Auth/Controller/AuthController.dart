import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Medicalcoursechoice/courseselect.dart';
import '../splach2.dart';
import '../../data/models/usermodel.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserModel? userData;
  bool loading = false;
  File? pickedImage;


  // Function to handle account creation
  Future<void> createAccount(GlobalKey<FormState> formKey, String email, String password, String fullName) async {
    if (formKey.currentState!.validate()) {
      loading = true;
      update();
      try {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
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
        await FirebaseFirestore.instance.collection('users').doc(userId).set(userModel.toJson());

        // Save user data to SharedPreferences
        await saveUserData(userModel);
        loading = false;

        Get.offAll(() => SelectyourCourse());
      } catch (e) {
        loading = false;
        update();
        Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }


  Future<void> updateAccount(UserModel userModel) async {
      loading = true;
      update();
      try {

        // Save user data to Firestore
        await FirebaseFirestore.instance.collection('users').doc(userModel.userId).set(userModel.toJson(),SetOptions(merge: true));

        // Save user data to SharedPreferences
        await saveUserData(userModel);
        Get.snackbar('Success',"User Details Updated", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
        loading = false;
      } catch (e) {
        loading = false;
        update();
        Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      }

  }


  // Function to handle login and load user data
  Future<void> login(GlobalKey<FormState> formKey, String email, String password) async {
    if (formKey.currentState!.validate()) {
      loading = true;
      update();
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );

        String userId = userCredential.user!.uid;

        // Fetch user data from Firestore using userId
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();

        if (userDoc.exists) {
          UserModel userModel = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
          await saveUserData(userModel);
          Get.offAll(() => SelectyourCourse());
        } else {
          loading = false;
          update();
          Get.snackbar('Error', 'User data not found.', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
        }
      } catch (e) {
        loading = false;
        update();
        Get.snackbar('Error', 'Login failed: $e', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  // Save user data to SharedPreferences
  Future<void> saveUserData(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', user.userId ?? '');
    await prefs.setString('fullName', user.fullName ?? '');
    await prefs.setString('email', user.email ?? '');
    await prefs.setString('state', user.state ?? '');
    await prefs.setString('city', user.city ?? '');
    if (user.photoUrl != null) {
      await prefs.setString('photoUrl', user.photoUrl!);
    }
    userData = user;
    update();
  }

  // Load user data from SharedPreferences
  Future<UserModel?> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? fullName = prefs.getString('fullName');
    String? email = prefs.getString('email');
    String? state = prefs.getString('state');
    String? city = prefs.getString('city');
    String? photoUrl = prefs.getString('photoUrl');

    if (userId != null && fullName != null && email != null) {
      var user = UserModel(
        userId: userId,
        fullName: fullName,
        email: email,
        state: state,
        city: city,
        photoUrl: photoUrl,
      );
      userData = user;
      update();
      return user;
    }
    return null;
  }

  // Check if user is logged in
  Future<void> checkUserLoggedIn() async {
    UserModel? user = await loadUserData();
    if (user != null) {
      Get.offAll(() => SelectyourCourse());
    } else {
      Get.offAll(() => SplashTwo());
    }
  }

  // Function to handle logout
  Future<void> logout() async {
    loading = true;
    update();
    try {
      // Sign out from Firebase Authentication
      await auth.signOut();

      // Clear user data from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      userData = null;
      update();

      // Redirect to Splash or Login Screen after logout
      Get.offAll(() => SplashTwo());

      loading = false;
    } catch (e) {
      loading = false;
      update();
      Get.snackbar('Error', 'Logout failed: $e', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

// Add this method inside the AuthController class
  Future<void> changePassword(GlobalKey<FormState> formKey, String newPassword, String confirmPassword) async {
    if (formKey.currentState!.validate()) {
      if (newPassword != confirmPassword) {
        Get.snackbar('Error', 'Passwords do not match.', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }
      loading = true;
      update();
      try {
        User? user = auth.currentUser;
        if (user != null) {
          // Update the password
          await user.updatePassword(newPassword);
          loading = false;
          update();

          Get.snackbar('Success', 'Password updated successfully!', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
          Get.offAll(() => SelectyourCourse());
        } else {
          loading = false;
          update();
          Get.snackbar('Error', 'User not logged in.', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
        }
      } catch (e) {
        loading = false;
        update();
        Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }


}
