import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mednextnew/home/qbanks/qbankanalysis.dart';

import '../../constants/colors.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  Color _borderColor = Colors.grey;
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
                        onTap:(){
                          Get.back();
                        },
                        child: Icon(Icons.chevron_left)),
                    Text('Ques 1 of 35',style: TextStyle(fontSize: 20),
                    ),
                    //Icon(Icons.sort_by_alpha),
                    Icon(Icons.pause_circle_outline_rounded),
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    Text('20 Questions • Attempted on 26th Aug 2021, 09:00AM',style: TextStyle(),),
                  ],
                ),
              ),
              SizedBox(height: Get.height*0.1,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _borderColor = _borderColor == Colors.grey ? Colors.green : Colors.grey;
                  });
                  Get.to(QBankAnalysis());

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    width: Get.width*0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: _borderColor),
                    ),
                    child: Center(child: Text('A. Primordial germ cell ',style: TextStyle(),)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _borderColor = _borderColor == Colors.grey ? Colors.green : Colors.grey;
                  });

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    width: Get.width*0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: _borderColor),
                    ),
                    child: Center(child: Text('A. Primordial germ cell ',style: TextStyle(),)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _borderColor = _borderColor == Colors.grey ? Colors.green : Colors.grey;
                  });

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    width: Get.width*0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: _borderColor),
                    ),
                    child: Center(child: Text('A. Primordial germ cell ',style: TextStyle(),)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _borderColor = _borderColor == Colors.grey ? Colors.green : Colors.grey;
                  });

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    width: Get.width*0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: _borderColor),
                    ),
                    child: Center(child: Text('A. Primordial germ cell ',style: TextStyle(),)),
                  ),
                ),
              ),



            ],
          ),
        ),
    );
  }
}
