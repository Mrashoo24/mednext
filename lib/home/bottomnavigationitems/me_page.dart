import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(

        ),

      ),
    );
  }
}
