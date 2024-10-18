import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Medicalcoursechoice/courseselect.dart';
import '../constants/colors.dart';
import 'loginscreen.dart';
import 'Createwithemail.dart';

class SplashTwo extends StatefulWidget {
  const SplashTwo({Key? key}) : super(key: key);

  @override
  State<SplashTwo> createState() => _SplashTwoState();
}

class _SplashTwoState extends State<SplashTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [Colors.greenAccent,Colors.white
            ]
             // Color(0xFF00FF3A)
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,

          body:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("asset/female.png"),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Image.asset("asset/excellence.png"),
              SizedBox(height: Get.height*0.1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Get.to(Createwithemail());

                  },
                  child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: kdeepblue,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: Text("Get started with one month free",style: TextStyle(fontSize: 15,color: Colors.white),))
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(color: kdarkgrey),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Get.to(Loginpage()
                      );
                    },
                    child: Text("Log in",style: TextStyle(color: kdeepblue),
                    ),
                  ),
                ],
              )
            ],
          )

        ),
      ),
    );
  }
}
