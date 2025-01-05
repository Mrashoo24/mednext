import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mednextnew/Adddetails/adddetails.dart';

import '../../constants/colors.dart';
import '../qbanks/startqbank.dart';

class Qbank extends StatefulWidget {
  const Qbank({Key? key}) : super(key: key);

  @override
  State<Qbank> createState() => _QbankState();
}

class _QbankState extends State<Qbank> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding (
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for videos, Qbanks',
                  prefixIcon: Icon(Icons.search,color: klightGrey,), // Search icon
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: klightGrey,), // Border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: klightGrey,), // Default border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: klightGrey, width: 1), // Border when focused
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  filled: true,
                  fillColor: Colors.grey[100], // Background color for the search bar
                ),
              ),
            ),
            Icon(Icons.check_circle,color: kbabyblue,size: 30,),
            Text("Past year Ques",style: TextStyle(fontSize: 14),),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Choose Subjects',style: TextStyle(fontSize: 16),),
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                Get.to(StartQBank(),
                );

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
              
                    Column(
                      children: [
                        Text("Anatomy",style: TextStyle(fontSize: 30),),
                        Text("0/56 Completed .56 Ques"),
                      ],
                    ),
                    Icon(Icons.chevron_right_sharp,size: 30,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(StartQBank());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [
                        Text("Physiology",style: TextStyle(fontSize: 30),),
                        Text("0/56 Completed .56 Ques"),
                      ],
                    ),
                    Icon(Icons.chevron_right_sharp,size: 30,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(StartQBank());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [
                        Text("Biochemistry",style: TextStyle(fontSize: 30),),
                        Text("0/56 Completed .56 Ques"),
                      ],
                    ),
                    Icon(Icons.chevron_right_sharp,size: 30,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(StartQBank());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [
                        Text("Pharmacology",style: TextStyle(fontSize: 30),
                        ),
                        Text("0/56 Completed .56 Ques"),
                      ],
                    ),
                    Icon(Icons.chevron_right_sharp,size: 30,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(StartQBank());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [
                        Text("Pathology",style: TextStyle(fontSize: 30),),
                        Text("0/56 Completed .56 Ques"),
                      ],
                    ),
                    Icon(Icons.chevron_right_sharp,size: 30,),
                  ],
                ),
              ),
            )

            

          ],
        ),
      ),
    );
  }
}
