//Write a code to display Splash Screen using Activity

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:module_four/Task1/HomeScreen.dart';

class MyTaskOne extends StatefulWidget {
  const MyTaskOne({Key? key}) : super(key: key);

  @override
  State<MyTaskOne> createState() => _MyTaskOneState();
}

class _MyTaskOneState extends State<MyTaskOne> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: FlutterLogo(
        size: MediaQuery.of(context).size.height,
      ),
    );
  }
}
