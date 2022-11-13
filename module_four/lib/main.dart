import 'package:flutter/material.dart';
import 'package:module_four/Task1/TaskSplash1.dart';
import 'package:module_four/Task2/Task2First.dart';
import 'package:module_four/Task2/Task2Second.dart';
import 'package:module_four/Task3/example_page.dart';
import 'package:module_four/Task3/home_page.dart';
import 'package:module_four/Task4/InputData.dart';
import 'package:module_four/Task5.dart';
import 'package:module_four/Task5/MyCallTaskFive.dart';
import 'package:module_four/Task5/MyShareTaskFive.dart';
import 'package:module_four/Task5/MySharingData.dart';
import 'package:module_four/Task5/TaskFiveMain.dart';
import 'package:module_four/Task6/MyTaskSix.dart';
import 'package:module_four/contextmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyMainTaskFive(),
    );
  }
}
