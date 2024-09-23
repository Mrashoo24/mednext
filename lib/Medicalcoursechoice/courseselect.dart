import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Adddetails/adddetails.dart';
import '../constants/colors.dart';


class SelectyourCourse extends StatefulWidget {
  const SelectyourCourse({Key? key}) : super(key: key);

  @override
  State<SelectyourCourse> createState() => _SelectyourCourseState();
}

class _SelectyourCourseState extends State<SelectyourCourse> {
  List<Item> _list = generateItems(10);
  Widget _buildListPanel(){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded){
        setState(() {
          _list[index]. isExpanded = !isExpanded;
        }
        );
      },
      children: _list.map<ExpansionPanel>((Item item ){
        return ExpansionPanel(
          headerBuilder: (BuildContext context,bool isExpanded){
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
             title: Text(item.courses),
            subtitle: Text("math"),
            trailing: Icon(Icons.dangerous),
            // onTap: (){},
          ),
          isExpanded: item.isExpanded

        );

      }
      ).toList(),

    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea  (
        child:Scaffold(
          appBar: AppBar(
            title: Text("Choose Medical Course"),
           centerTitle: true,
          leading: IconButton(
            onPressed: (){},
            icon: IconButton(
              icon: Icon(Icons.chevron_left,size: 30,),
              onPressed: () {
                Get.back();
              },
            ),

          ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildListPanel(),
                GestureDetector(
                  onTap: (){
                   Get.to( AddMoreDetails());
                  },
                  child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: kdeepblue,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: Text("Save",style: TextStyle(fontSize: 15,color: Colors.white),))
                  ),
                ),
              ],
            ),


          ),
        ),
    );
  }
}

class Item {
   String courses;
   String headerValue;
   bool isExpanded;
  Item({ this.isExpanded = true,required this.headerValue,required this.courses});
 }
List<Item> generateItems(int numberOfItems){
  return List.generate(numberOfItems, (index){
    return Item(
      headerValue: "Course ",
      courses: "This is course number $index",



      
    );
  }
  );

}


