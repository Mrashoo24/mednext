import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../Auth/Controller/AuthController.dart';
import '../constants/colors.dart';
import '../home/homescreen.dart';

class AddMoreDetails extends StatefulWidget {
  const AddMoreDetails({Key? key}) : super(key: key);

  @override
  State<AddMoreDetails> createState() => _AddMoreDetailsState();
}

class _AddMoreDetailsState extends State<AddMoreDetails> {
  String? validateEmail(String?value){

  }
  bool securetext = true;
  bool value = false;
  final _formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  File? _pickedImage;
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }
  @override



  Widget build(BuildContext context) {
    return SafeArea  (
      child:Scaffold(
        appBar: AppBar(
          title: const Text("Add other details"),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){

            },
            icon: IconButton(
              icon: const Icon(Icons.chevron_left,size: 30,),
              onPressed: () {
                Get.back();
              },
            ),

          ),
        ),
        // body: SingleChildScrollView(
        //  child: Form(
        //    key: _formkey,
        //    child: Column(
        //      children: [
        //        Text("Sign up with +91 1231231231"),
        //        Padding(
        //          padding: const EdgeInsets.all(20.0),
        //          child: Container(
        //            height: 45,
        //            child: TextFormField(
        //              validator: (value) {
        //                // Check if this field is empty
        //                if (value == null || value.isEmpty) {
        //                  return 'This field is required';
        //                }
        //
        //                // using regular expression
        //                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        //                  return "Please fill the required details";
        //                }
        //
        //                // the email is valid
        //                return null;
        //              },
        //              decoration: InputDecoration(
        //
        //                labelText:"Full Name",
        //                labelStyle: TextStyle(color:kdeepblue,fontSize: 15),
        //                border: OutlineInputBorder(
        //                    borderRadius: BorderRadius.circular(15),
        //                    borderSide: BorderSide(color: kdeepblue)
        //                ),
        //                focusedBorder: OutlineInputBorder(
        //                    borderRadius: BorderRadius.circular(15),
        //                    borderSide: BorderSide(color: kdeepblue)
        //                ),
        //                enabledBorder: OutlineInputBorder(
        //                    borderRadius: BorderRadius.circular(15),
        //                    borderSide: BorderSide(color: kdeepblue)
        //                ),
        //
        //
        //
        //              ),
        //
        //            ),
        //          ),
        //        ),
        //        Padding(
        //          padding: const EdgeInsets.only(left: 20,right: 20,top: 70),
        //          child: Container(
        //            height: 45,
        //            child: TextFormField(
        //              controller: emailController,
        //              validator: (value) {
        //                // Check if this field is empty
        //                if (value == null || value.isEmpty) {
        //                  return 'This field is required';
        //                }
        //
        //                // using regular expression
        //                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        //                  return "Please enter a valid email address";
        //                }
        //
        //                // the email is valid
        //                return null;
        //              },
        //              decoration: InputDecoration(
        //
        //                labelText:"Email-Address",
        //                labelStyle: TextStyle(color:kdeepblue,fontSize: 15),
        //
        //                border: OutlineInputBorder(
        //                    borderRadius: BorderRadius.circular(15),
        //                    borderSide: BorderSide(color: kdeepblue)
        //                ),
        //                focusedBorder: OutlineInputBorder(
        //                    borderRadius: BorderRadius.circular(15),
        //                    borderSide: BorderSide(color: kdeepblue)
        //                ),
        //                enabledBorder: OutlineInputBorder(
        //                    borderRadius: BorderRadius.circular(15),
        //                    borderSide: BorderSide(color: kdeepblue)
        //                ),
        //              ),
        //
        //            ),
        //          ),
        //        ),
        //        Padding(
        //          padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
        //          child: GestureDetector(
        //            onTap: (){
        //              if(_formkey.currentState!.validate()
        //              ){
        //                return;
        //              }else{
        //
        //
        //                print("Enter valid Email");
        //              }
        //              Get.to(Homescreenone() );
        //            },
        //            child: Container(
        //                height: 45,
        //                width: double.infinity,
        //                decoration: BoxDecoration(
        //                    color: kdeepblue,
        //                    borderRadius: BorderRadius.circular(15)
        //                ),
        //                child: Center(child: Text("Save",style: TextStyle(fontSize: 15,color: Colors.white),))
        //            ),
        //          ),
        //        ),
        //
        //
        //
        //      ],
        //    ),
        //  ),
        // ), temproraryly commented
        body:GetBuilder(
          init: AuthController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign up with "),
                      Text(''),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Show options to pick from gallery or camera
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
                                  Get.back(); // Close the bottom sheet
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo),
                                title: const Text("Choose from Gallery"),
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                  Get.back(); // Close the bottom sheet
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
                        _pickedImage != null ? FileImage(_pickedImage!) : null,
                        child: _pickedImage == null
                            ? const Icon(Icons.person, color: Colors.white, size: 100)
                            : null, // Show default icon if no image is picked
                      ),
                    ),
                  ),


                  SizedBox(height: 20,),
                  // Center(child: Icon(Icons.person_pin,color: Colors.tealAccent,size: 200,),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                    child: Container(
                      height: 45,
                      child: TextFormField(

                        decoration: InputDecoration(

                          labelText:"Enter Name",
                          labelStyle: TextStyle(color:kdeepblue,fontSize: 15),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kdeepblue)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kdeepblue)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kdeepblue)
                          ),

                        ),
                        // obscureText: securetext,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                    child: Container(
                      height: 45,
                      child: TextFormField(

                        decoration: InputDecoration(

                          labelText:"Email Address",
                          labelStyle: TextStyle(color:kdeepblue,fontSize: 15),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kdeepblue)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kdeepblue)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kdeepblue)
                          ),

                        ),
                        // obscureText: securetext,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                    child: Container(
                      height: 45,
                      child: TextFormField(

                        decoration: InputDecoration(

                          labelText:"Select State",
                          labelStyle: TextStyle(color:kdeepblue,fontSize: 15),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kdeepblue)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kdeepblue)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kdeepblue)
                          ),

                        ),
                        // obscureText: securetext,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height*0.2,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(Homescreenone(),);
                      },
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kdeepblue,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text("Continue",style: TextStyle(fontSize: 15,color: Colors.white),
                        ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),

      ),
    );
  }
}
