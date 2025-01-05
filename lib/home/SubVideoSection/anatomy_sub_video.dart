import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/colors.dart';

class Anatomy extends StatefulWidget {
  const Anatomy({Key? key}) : super(key: key);

  @override
  State<Anatomy> createState() => _AnatomyState();
}

class _AnatomyState extends State<Anatomy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
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
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [
                      Text('Anatomy',style: TextStyle(fontSize: 25),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child:Icon(Icons.person),
                      ),
                      SizedBox(width: 10,),
                      Text('Dr Rajesh Kaushal'),
                      SizedBox(width: Get.width*0.4),
                      Icon(Icons.chevron_right)

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding (
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child:Icon(Icons.person),
                      ),
                      SizedBox(width: 10,),
                      Text('Dr Rebbeka'),
                      SizedBox(width: Get.width*0.5),
                      Icon(Icons.chevron_right)

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child:Icon(Icons.person),
                      ),
                      SizedBox(width: 10,),
                      Text('Dr B Sick'),
                      SizedBox(width: Get.width*0.55),
                      Icon(Icons.chevron_right)

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child:Icon(Icons.person),
                      ),
                      SizedBox(width: 10,),
                      Text('Dr Watamuniuk'),
                      SizedBox(width: Get.width*0.45),
                      Icon(Icons.chevron_right)

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
