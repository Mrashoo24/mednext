import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../constants/colors.dart';
import '../constants/global.dart';

class Setnewpassword extends StatefulWidget {
  const Setnewpassword({Key? key}) : super(key: key);

  @override
  State<Setnewpassword> createState() => _SetnewpasswordState();
}

class _SetnewpasswordState extends State<Setnewpassword> {
  bool securetext = true;
  bool value = false;
  final _formkey = GlobalKey<FormState>();
  var newpassWordcontroller = TextEditingController();
  var passWordController = TextEditingController();
  var confirmPasswordController =TextEditingController();
  bool loading = false;

  Future<void> changePassword() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      try {
        // Get the currently logged-in user
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          // Change password
          await user.updatePassword(newpassWordcontroller.text.trim());
          Get.snackbar('Success', 'Password updated successfully!',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white);
        } else {
          Get.snackbar('Error', 'User not logged in',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        }
      } catch (e) {
        Get.snackbar('Error', 'An error occurred: $e',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body:   Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top:69),
                    child: Center(child: Image.asset('asset/setpass.png'),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                child: Container(

                  child: TextFormField(
                    controller: newpassWordcontroller,

                    validator: (value){
                      if(value == null || value.isEmpty)
                      {
                        return "This field is required";
                      }
                      if(value.length<6){
                        return "The required length is minium 6 ";
                      }
                    },

                    decoration: InputDecoration(
                      //  errorStyle: ,
                      labelText:"New Password",
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                      suffixIcon: IconButton(
                        icon:Icon( securetext? Icons.visibility_off: Icons.visibility,color: kdeepblue, ),
                        onPressed: (){
                          setState(() {
                            securetext = !securetext;
                          }
                          );
                        },
                      ),
                    ),
                    obscureText: securetext,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                child: Container(

                  child: TextFormField(
                    controller: passWordController,

                    validator: (value){
                      if(value == null || value.isEmpty)
                      {
                        return "This field is required";
                      }
                      if(value.length<6){
                        return "The required length is minium 6 ";
                      }
                    },

                    decoration: InputDecoration(
                      //  errorStyle: ,
                      labelText:"Confirm Password",
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                      suffixIcon: IconButton(
                        icon:Icon( securetext? Icons.visibility_off: Icons.visibility,color: kdeepblue, ),
                        onPressed: (){
                          setState(() {
                            securetext = !securetext;
                          }
                          );
                        },
                      ),
                    ),
                    obscureText: securetext,
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                child: GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      authController.changePassword(
                        _formkey,
                        newpassWordcontroller.text.trim(),
                        confirmPasswordController.text.trim(),
                      );
                    } else {
                      print("Invalid password");
                    }
                  },
                  child: Container(


                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: kdeepblue,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child
                          : Text("Continue",style: TextStyle(fontSize: 15,color: Colors.white),
                      ),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}
