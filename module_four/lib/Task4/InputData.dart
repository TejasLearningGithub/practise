import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:module_four/Task4/SecondScreen.dart';

class MyInputData extends StatefulWidget {
  const MyInputData({Key? key}) : super(key: key);

  @override
  State<MyInputData> createState() => _MyInputDataState();
}

class _MyInputDataState extends State<MyInputData> {
  TextEditingController _number1 = TextEditingController();
  TextEditingController _number2 = TextEditingController();
  int? num3;
  int? userAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input two numbers'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _number1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter First Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _number2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Second Number'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  num3 = int.parse(_number1.text) + int.parse(_number2.text);
                  print(num3);
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MySecondActivity(num3!),
                  ),
                );
              },
              child: Text('Addition'),
            ),
          ],
        ),
      ),
    );
  }
}
