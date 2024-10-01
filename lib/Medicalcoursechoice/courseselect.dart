import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mednextnew/Auth/Controller/categoryController.dart';

import '../Adddetails/adddetails.dart';
import '../constants/colors.dart';
import '../data/models/categorymodel.dart';


class SelectyourCourse extends StatefulWidget {
  const SelectyourCourse({Key? key}) : super(key: key);

  @override
  State<SelectyourCourse> createState() => _SelectyourCourseState();
}

class _SelectyourCourseState extends State<SelectyourCourse> {

  CategoryController controller = Get.put(CategoryController());

 @override
  void initState() {

   controller.getCategories();
   controller.getCourse();
   super.initState();
  }

  Widget _buildListPanel(CategoryController controller){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded){
        // setState(() {
          controller.categories[index]. isExpanded =  !controller.categories[index].isExpanded! ;
          controller.update();
        // }
        // );
      },
      children: controller.categories.map<ExpansionPanel>((CategoryModel item ){
        return ExpansionPanel(
          headerBuilder: (BuildContext context,bool isExpanded){



            return ListTile(
              title: Text(item.name),
            );
          },
          body: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.courses.where((element) => element.categoryid == item.id).length,
            itemBuilder: (context,index) {

              var course = controller.courses.where((element) => element.categoryid == item.id).toList()[index];

              return ListTile(
                 title: Text(course.name),
                subtitle: Text(course.name),
                //trailing: Icon(Icons.dangerous),
                // onTap: (){},
              );
            }
          ),
          isExpanded: item.isExpanded!

        );

      }
      ).toList(),

    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea  (
        child:GetBuilder(
          init: CategoryController(),
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Choose Medical Course"),
               centerTitle: true,
                automaticallyImplyLeading: true,
              ),
              body: controller.loading ? Center(child: CircularProgressIndicator(),) :SingleChildScrollView(
                child: Column(
                  children: [
                    _buildListPanel( controller),
                    SizedBox(height: Get.height * 0.5,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
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
                    ),
                  ],
                ),


              ),
            );
          }
        ),
    );
  }
}

class Item {
   String courses;
   String headerValue;
   bool isExpanded;
  Item({ this.isExpanded = false,required this.headerValue,required this.courses});
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


