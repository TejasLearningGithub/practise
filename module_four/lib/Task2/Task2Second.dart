import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:module_four/Task2/Task2First.dart';

class MyTaskTwoSecond extends StatefulWidget {
  const MyTaskTwoSecond({Key? key}) : super(key: key);

  @override
  State<MyTaskTwoSecond> createState() => _MyTaskTwoSecondState();
}

class _MyTaskTwoSecondState extends State<MyTaskTwoSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Second Activity',
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
                      builder: (context) => MyTaskTwoFirst(),
                    ),
                  );
                },
                child: Text(
                  'Go To First Activity',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.yellow,
    );
  }
}
