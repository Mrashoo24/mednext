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
    return ExpansionPanelList.radio(
      expandedHeaderPadding: EdgeInsets.symmetric(vertical: 0),

      expansionCallback: (int index, bool isExpanded){
        // setState(() {
          controller.categories[index]. isExpanded =  !controller.categories[index].isExpanded! ;
          controller.update();
        // }
        // );
      },
      children: controller.categories.map<ExpansionPanel>((CategoryModel item ){
        return ExpansionPanelRadio(
          headerBuilder: (BuildContext context,bool isExpanded){



            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              title: Text(item.name,style: TextStyle(fontSize: 14),),
            );
          },
          body: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.courses.where((element) => element.categoryid == item.id).length,
            itemBuilder: (context,index) {

              var course = controller.courses.where((element) => element.categoryid == item.id).toList()[index];

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        child: Text(course.name,style: TextStyle(fontSize: 12),),
                      ),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: Radio(value: course.id, groupValue: controller.selectedCourseId,
                            activeColor: Colors.black,
                            onChanged: (value){
                          controller.selectedCourseId = value ?? "";
                          controller.update();
                        }),
                      )
                    ],
                  ),
                  if(course.id == controller.selectedCourseId)   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course.questionTitle,style: TextStyle(color: klightGrey,fontSize: 10,fontWeight: FontWeight.w500),),
                        Column(
                          children:course.questionOptions.map((e) {
                            return Row(
                              children: [

                                Radio(value: e, groupValue: controller.selectedQQuestionId,
                                    activeColor: Colors.black,
                                    onChanged: (value){
                                      controller.selectedQQuestionId = value ?? "";
                                      controller.update();
                                    }),
                                Text(e,style: TextStyle(fontSize: 12),),
                              ],
                            );
                          }).toList()
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          ),
          value: item.id

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
              bottomNavigationBar: Padding(
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
              body: controller.loading ? Center(child: CircularProgressIndicator(),) :SingleChildScrollView(
                child: Column(
                  children: [
                    _buildListPanel( controller),
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


