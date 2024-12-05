import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mednextnew/data/models/usermodel.dart';

import '../Auth/Controller/AuthController.dart';
import '../constants/colors.dart';
import '../home/bottomnavigationitems/homescreen.dart';

class AddMoreDetails extends StatefulWidget {
  const AddMoreDetails({Key? key}) : super(key: key);

  @override
  State<AddMoreDetails> createState() => _AddMoreDetailsState();
}

class _AddMoreDetailsState extends State<AddMoreDetails> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  File? _pickedImage;
  String? imageUrl;

  // Dropdown-related variables
  String selectedState = "Maharashtra";
  String selectedCity = "Mumbai";
  final List<String> states = ["Maharashtra", "Delhi", "Karnataka"];
  final Map<String, List<String>> cities = {
    "Maharashtra": ["Mumbai", "Pune", "Nagpur"],
    "Delhi": ["New Delhi", "Old Delhi"],
    "Karnataka": ["Bangalore", "Mysore"]
  };

  final AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();
    _prefillUserData();
  }

  Future<void> _prefillUserData() async {
    if (authController.userData != null) {
      nameController.text = authController.userData!.fullName ?? '';
      emailController.text = authController.userData!.email ?? '';
      selectedState = ((authController.userData!.state ?? 'Maharashtra') == "" ? "Maharashtra" : authController.userData!.state)!;
      selectedCity = ((authController.userData!.city ??cities[selectedState]![0]) == "" ? cities[selectedState]![0] : authController.userData!.city)!;

      imageUrl = authController.userData!.photoUrl;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
      await _uploadImageToFirebase();
    }
  }

  Future<void> _uploadImageToFirebase() async {
    if (_pickedImage == null) return;
    setState(() {
      loading = true;
    });

    String fileName = '${authController.userData!.userId}_profile.jpg';
    FirebaseStorage storage = FirebaseStorage.instance;
    try {
      TaskSnapshot snapshot = await storage
          .ref()
          .child('profile_pictures/$fileName')
          .putFile(_pickedImage!);

      String downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
        loading = false;
      });

      // Update user profile picture URL in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authController.userData!.userId)
          .update({'photoUrl': imageUrl});
    } catch (e) {
      setState(() {
        loading = false;
      });
      Get.snackbar('Error', 'Failed to upload image.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Other Details"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, size: 30),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: GetBuilder<AuthController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera),
                                title: const Text("Take Photo"),
                                onTap: () {
                                  _pickImage(ImageSource.camera);
                                  Get.back();
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo),
                                title: const Text("Choose from Gallery"),
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.tealAccent,
                        backgroundImage:
                        imageUrl != null ? NetworkImage(imageUrl!) : null,
                        child: imageUrl == null
                            ? const Icon(Icons.person, color: Colors.white, size: 100)
                            : null,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Enter Name",
                          labelStyle: TextStyle(color: kdeepblue, fontSize: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kdeepblue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kdeepblue),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email Address",
                          labelStyle: TextStyle(color: kdeepblue, fontSize: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kdeepblue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: kdeepblue),
                          ),
                        ),
                        readOnly: emailController.text.isNotEmpty,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: DropdownButtonFormField<String>(
                        value: selectedState,
                        items: states.map((state) {
                          return DropdownMenuItem<String>(
                            value: state,
                            child: Text(state),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedState = value!;
                            selectedCity = cities[selectedState]!.first;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Select State",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your state';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: DropdownButtonFormField<String>(
                        value: selectedCity,
                        items: cities[selectedState]!.map((city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCity = value!;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Select City",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your city';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextFormField(
                        initialValue: "India",
                        enabled: false, // Country is defaulted to India and cannot be changed
                        decoration: InputDecoration(
                          labelText: "Country",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            // Show loading indicator while saving
                            setState(() {
                              loading = true;
                            });

                            var newUserModel = controller.userData!.copyWith(
                              // userId:controller.userData!.userId.toString(),
                              fullName: nameController.text.toString(),
                              // email:controller.userData!.email.toString(),
                              state: selectedState,
                              photoUrl: imageUrl,
                              city: selectedCity,
                            );

                            // Call saveUserData function from your AuthController
                            await authController.updateAccount(
                              newUserModel
                            );

                            // After saving, navigate to the next screen
                            setState(() {
                              loading = false;
                            });

                            // Navigate to home screen if save is successful
                            Get.offAll(() => Homescreenone());
                          }
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kdeepblue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: loading
                                ? CircularProgressIndicator(color: Colors.white)
                                : const Text(
                              "Save & Continue",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
