import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:module_four/Task2/Task2Second.dart';

class MyTaskTwoFirst extends StatefulWidget {
  const MyTaskTwoFirst({Key? key}) : super(key: key);

  @override
  State<MyTaskTwoFirst> createState() => _MyTaskTwoFirstState();
}

class _MyTaskTwoFirstState extends State<MyTaskTwoFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My First Screen',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => MyTaskTwoSecond()),
                    ),
                  );
                },
                child: Text(
                  'Go To Second Activity',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
