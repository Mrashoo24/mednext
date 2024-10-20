import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.blue,
      ),
    );
  }
}
