import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MySecondActivity extends StatefulWidget {
  final int userAnswer;
  const MySecondActivity(this.userAnswer, {Key? key}) : super(key: key);

  @override
  State<MySecondActivity> createState() => _MySecondActivityState();
}

class _MySecondActivityState extends State<MySecondActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer'),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.userAnswer.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
