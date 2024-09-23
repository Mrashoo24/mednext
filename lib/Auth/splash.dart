import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mednextnew/Auth/Controller/AuthController.dart';
import 'package:mednextnew/Auth/splach2.dart';
import 'package:mednextnew/constants/global.dart';

import 'loginscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      authController.checkUserLoggedIn();

    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("asset/startlearn.png"),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                SizedBox(
                  width: Get.width * 0.60,
                ),
                Image.asset("asset/Arrow_10.png"),
              ],
            ),
            Image.asset("asset/Male.png")
          ],
        ),
      ),
    );
  }
}
