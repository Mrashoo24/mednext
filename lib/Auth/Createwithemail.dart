import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mednextnew/Auth/Controller/AuthController.dart';

import '../Medicalcoursechoice/courseselect.dart';
import '../constants/colors.dart';
import 'mobilelogin.dart';

class Createwithemail extends StatefulWidget {
  const Createwithemail({Key? key}) : super(key: key);

  @override
  State<Createwithemail> createState() => _CreatewithemailState();
}

class _CreatewithemailState extends State<Createwithemail> {
  bool securetext = true;
  bool securetext1 = true;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<AuthController>(
          init: Get.put(AuthController()),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(CupertinoIcons.left_chevron)),
                      Padding(
                        padding: const EdgeInsets.only(top: 69),
                        child: Center(
                          child: Image.asset('asset/createacc.png'),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Full Name Field
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
                          child: TextFormField(
                            controller: _nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Full Name is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Full Name",
                              labelStyle: TextStyle(color: kdeepblue, fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                            ),
                          ),
                        ),
                        // Email Field
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Email Address",
                              labelStyle: TextStyle(color: kdeepblue, fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                            ),
                          ),
                        ),
                        // Password Field
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: securetext,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: kdeepblue, fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  securetext ? Icons.visibility_off : Icons.visibility,
                                  color: kdeepblue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    securetext = !securetext;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        // Confirm Password Field
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: securetext1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm Password is required';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(color: kdeepblue, fontSize: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: kdeepblue)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  securetext1 ? Icons.visibility_off : Icons.visibility,
                                  color: kdeepblue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    securetext1 = !securetext1;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Create Account Button
                controller.loading ? Center(child: CircularProgressIndicator(),) :  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: GestureDetector(
                      onTap: () async {

                         await   controller.createAccount(
                              _formKey,
                              _emailController.text,
                              _passwordController.text,
                              _nameController.text);
                        },
                      child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kdeepblue, borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                                "Create Account",
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ))),
                    ),
                  ),
                  SizedBox(height: Get.height*0.2,),

                  GestureDetector(
                    onTap: (){
                        Get.to(Mobileloginpage());

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Continue with with phone number',style: TextStyle(fontSize: 15,color: kblack,),
                        ),
                        Icon(Icons.chevron_right_sharp,color: kblack,)
                      ],
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
