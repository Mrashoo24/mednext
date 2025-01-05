import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mednextnew/constants/colors.dart';
import 'package:mednextnew/home/qbanks/question.dart';

class StartQBank extends StatefulWidget {
  const StartQBank({super.key});

  @override
  State<StartQBank> createState() => _StartQBankState();
}

class _StartQBankState extends State<StartQBank> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                        },
                        child: Icon(Icons.chevron_left,size: 25,),
                    ),
                    Icon(Icons.share_rounded,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Lower Extremity Nerve Supply"),
                    SizedBox(width: Get.width*0.1,),
                    Text('4.5'),
                    Icon(Icons.star,color: kyellow,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("Anatomy",style: TextStyle(color: kdeepblue),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Germ Cell Derivative',style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("20 Questions • Attempted on 26th Aug 2021, 09:00AM",style: TextStyle(),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(Questions());
                  },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    width: Get.width*0.8,
                    decoration: BoxDecoration(
                      color: kdeepblue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(child: Text('Start QBank',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 17),)),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Micro topics covered',style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('we advice you to study these micro topics thoroughly \nbefor attempting the QBank.',style: TextStyle(),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Branchial cleft remnants',style: TextStyle(),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Commissures of brain',style: TextStyle(),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Derivatives of mesoderm',style: TextStyle(),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Development of Gut',style: TextStyle(),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Development of heart  ',style: TextStyle(),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Development of placenta',style: TextStyle(),),
                  ],
                ),
              ),



            ],
          ),
        ),
    );
  }
}
