import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mednextnew/Auth/Controller/AuthController.dart';
import 'package:mednextnew/constants/global.dart';

import '../constants/colors.dart';
import 'Createwithemail.dart';
import 'mobilelogin.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String? validateEmail(String? value) {}
  bool securetext = true;
  bool value = false;
  final _formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();

  @override
  void intiState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 69),
                    child: Center(
                      child: Image.asset('asset/welcome text.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
                  child: Container(
                    height: 45,
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        // Check if this field is empty
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        // using regular expression
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }

                        // the email is valid
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email-Address",
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Container(
                    height: 45,
                    child: TextFormField(
                      controller: passWordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        }
                        if (value.length < 6) {
                          return "The required length is minium 6 ";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        //  errorStyle: ,
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
                            securetext
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: kdeepblue,
                          ),
                          onPressed: () {
                            setState(() {
                              securetext = !securetext;
                            });
                          },
                        ),
                      ),
                      obscureText: securetext,
                    ),
                  ),
                ),
                GetBuilder<AuthController>(
                  init: authController,
                  builder: (controller) {
                    return  controller.loading ? Center(child: CircularProgressIndicator(),) : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                           await  controller.login(_formkey, emailController.text, passWordController.text);
                          } else {
                            print("Enter valid Email");
                          }
                          //Get.to();
                        },
                        child: Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: kdeepblue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              "Continue",
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ))),
                      ),
                    );
                  }
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: kgrey, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Image.asset("asset/or.png"),
                ),
                Image.asset("asset/google.png"),
                Image.asset("asset/facebook.png"),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Createwithemail());
                  },
                  child: Text(
                    'Create account with email address',
                    style: TextStyle(color: kdeepblue),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Mobileloginpage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue with with phone number',
                        style: TextStyle(
                          fontSize: 15,
                          color: kblack,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_sharp,
                        color: kblack,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
