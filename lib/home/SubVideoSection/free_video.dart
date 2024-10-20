import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mednextnew/constants/colors.dart';

class FreeVideo extends StatefulWidget {
  const FreeVideo({Key? key}) : super(key: key);

  @override
  State<FreeVideo> createState() => _FreeVideoState();
}

class _FreeVideoState extends State<FreeVideo> {
  @override
  Widget build(BuildContext context) {
    var width0;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20),
            child: Row(
              children: [
                Text("Select Subjects",style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Icon(Icons.heart_broken),
                SizedBox(width: 20),
                Column(
                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Anatomy",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),
                    ),

                    Text("760 students Learning"),

                  ],
                ),
                SizedBox(width: Get.width*0.4),
                Icon(Icons.chevron_right,color: kdarkgrey,size: 40,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.heart_broken),
                SizedBox(width: 20),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Physiology",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),
                    ),

                    Text("760 students Learning"),

                  ],
                ),
                SizedBox(width: Get.width*0.4),
                Icon(Icons.chevron_right,color: kdarkgrey,size: 40,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.heart_broken),
                SizedBox(width: 20),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Biochemistry",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),
                    ),

                    Text("760 students Learning"),

                  ],
                ),
                SizedBox(width: Get.width*0.4),
                Icon(Icons.chevron_right,color: kdarkgrey,size: 40,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.heart_broken),
                SizedBox(width: 20),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text("Pathology",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),
                    ),

                    Text("760 students Learning"),

                  ],
                ),
                SizedBox(width: Get.width*0.4),
                Icon(Icons.chevron_right,color: kdarkgrey,size: 40,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.heart_broken),
                SizedBox(width: 20),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Pharmacology",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),
                    ),

                    Text("760 students Learning"),

                  ],
                ),
                SizedBox(width: Get.width*0.4),
                Icon(Icons.chevron_right,color: kdarkgrey,size: 40,)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
