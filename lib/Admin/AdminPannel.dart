import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Adminpannel extends StatefulWidget {
  const Adminpannel({Key? key}) : super(key: key);

  @override
  State<Adminpannel> createState() => _AdminpannelState();
}

class _AdminpannelState extends State<Adminpannel> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Medical PG",
            ),
            actions: [

              //  Image.asset("m")
            ],
          ),
          body: SingleChildScrollView(
          child:   Column(
              children: [
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Welcome Admin',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Your students have completed 80% of the task',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Student Count",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10), // Adds space between the texts
                        Text(
                          'FMGE',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(

                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10), // Adds space between the texts
                        Text(
                          'Medical PG',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(

                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10), // Adds space between the texts
                        Text(
                          'Residency Psychiatry',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(

                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10), // Adds space between the texts
                        Text(
                          'Residency ENT',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(

                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10), // Adds space between the texts
                        Text(
                          'Residency OBS-GYN',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(

                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10), // Adds space between the texts
                        Text(
                          'Residency Radiology',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(

                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10), // Adds space between the texts
                        Text(
                          'SS Medicine',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(

                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10), // Adds space between the texts
                        Text(
                          'SS Surgery',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(

                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10), // Adds space between the texts
                        Text(
                          'SS Pediatrics',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
                SizedBox(width: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Test Series",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 250,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(

                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '2',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10), // Adds space between the texts
                            Text(
                              'Test 1',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        width: 250,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(

                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '2',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10), // Adds space between the texts
                            Text(
                              'Test 2',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        width: 250,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(

                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '2',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10), // Adds space between the texts
                            Text(
                              'Test 3',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        width: 250,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(

                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '2',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10), // Adds space between the texts
                            Text(
                              'Test 4',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),

                    ],
                  ),
                ),


              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Icon(Icons.apps),
                        SizedBox(width: 10,),
                        Text("Dashboard",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.apps),
                        SizedBox(width: 10,),
                        Text("Courses",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.apps),
                        SizedBox(width: 10,),
                        Text("Subject",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.apps),
                        SizedBox(width: 10,),
                        Text("Chapter Bank",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.apps),
                        SizedBox(width: 10,),
                        Text("Question Bank",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.apps),
                        SizedBox(width: 10,),
                        Text("Live Classes",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.apps),
                        SizedBox(width: 10,),
                        Text("Tests",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.apps),
                        SizedBox(width: 10,),
                        Text("Registered Students ",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.logout),
                        SizedBox(width: 10,),
                        Text("Logout",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        );
  }
}
