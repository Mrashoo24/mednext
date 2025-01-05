import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/colors.dart';

class QBankAnalysis extends StatefulWidget {
  const QBankAnalysis({super.key});

  @override
  State<QBankAnalysis> createState() => _QBankAnalysisState();
}

class _QBankAnalysisState extends State<QBankAnalysis> {
  int _rating = 0;
  final Color activeColor = kdeepblue;
  final Color inactiveColor = kgrey;
  String selectedButton = '';
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.chevron_left)),
                    Text('QBank Analysis',style: TextStyle(fontSize: 20),
                    ),
                    //Icon(Icons.sort_by_alpha),
                    Icon(Icons.share_rounded),
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
                    Text("Completed on 26th Aug 2021, 09:00AM",style: TextStyle(),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    width: Get.width*0.9,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kgrey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Total questions 35',style: TextStyle(),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Row(
                           // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("08",style: TextStyle(color: Colors.green),),
                              SizedBox(width: 10,),
                              Text("Correct"),
                              SizedBox(width: 10,),
                              Text("27",style: TextStyle(color: Colors.red),),
                              SizedBox(width: 10,),
                              Text("Incorrect"),
                              SizedBox(width: 10,),
                              Text("00",style: TextStyle(color: kyellow ),),
                              SizedBox(width: 10,),
                              Text("Missed"),
                              SizedBox(width: 30,),
                              Column(
                                children: [
                                  Text("23%"),
                                  Text("Correct"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            //  SizedBox(height: 10,),
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
              Text("How was your Qbank tanking experience?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
              ),
              Text("Your feedback will help us improve your \nQBank Experience",style: TextStyle(),
              ),
      Row(
        mainAxisSize: MainAxisSize.min, // Centers the stars horizontally
        children: List.generate(5, (index) {
          return IconButton(
            onPressed: () {
              setState(() {
                _rating = index + 1; // Set rating to the star index clicked
              });
            },
            icon: Icon(
              index < _rating ? Icons.star : Icons.star_border, // Filled or outlined star
              color: kyellow,
              size: 40,
            ),
          );
        }),
      ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedButton = 'Quit'; // Mark "Quit" as selected
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45,
                        width: Get.width*0.4,
                        decoration: BoxDecoration(
                          color: selectedButton == 'Quit' ? activeColor : inactiveColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text('Quit',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 17),)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedButton = 'Next Module'; // Mark "Next Module" as selected
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45,
                        width: Get.width*0.4,
                        decoration: BoxDecoration(
                          color: selectedButton == 'Next Module' ? activeColor : inactiveColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text('Next Module',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 17),)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 45
                ,)


            ],
          ),
        ),
    );
  }
}
