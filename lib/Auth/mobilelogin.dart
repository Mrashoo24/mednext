// import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mednextnew/Auth/newpassword.dart';

import '../constants/colors.dart';
import 'loginscreen.dart';

class Mobileloginpage extends StatefulWidget {
  const Mobileloginpage({Key? key}) : super(key: key);

  @override
  State<Mobileloginpage> createState() => _MobileloginpageState();
}

class _MobileloginpageState extends State<Mobileloginpage> {
  // final countrypicker = FlCountryCodePicker();
  // CountryCode? countryCode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(CupertinoIcons.left_chevron)),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top:69),
                        child:
                        Center(child: Image.asset('asset/mobilesignin.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60,),
                Padding(
                  padding:  EdgeInsets.only(left: Get.width*0.06),
                  child: Row(

                    children: [
                      Text("Login Or Sign-Up",style: TextStyle(color: kdeepblue),),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    child: TextFormField(
                      keyboardType: TextInputType.number,

                      inputFormatters: [LengthLimitingTextInputFormatter(10)],

                      decoration: InputDecoration(
                        labelText: "Enter your mobile number",

                       // hintText:"Enter your mobile number",
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

                    ),
                  ),
                ),

                SizedBox(height: Get.height*0.4,),

                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                  child: GestureDetector(
                    onTap: (){
                      Get.to(Setnewpassword(),
                      );
                    },
                    child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kdeepblue,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text("Get OTP",style: TextStyle(fontSize: 15,color: Colors.white),
                        ),
                        ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text("By clicking i accept terms of use and Privacy Policy"),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Get.to(Loginpage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Login with Email",style: TextStyle(color: kblack),
                      ),
                      Icon(Icons.chevron_right_sharp,color: kblack,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
