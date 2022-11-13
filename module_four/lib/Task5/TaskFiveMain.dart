import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:module_four/Task5/MailTask.dart';
import 'package:module_four/Task5/MyCallTaskFive.dart';
import 'package:module_four/Task5/MySMSTaskFive.dart';
import 'package:module_four/Task5/MyShareTaskFive.dart';
import 'package:module_four/Task5/MySharingData.dart';

class MyMainTaskFive extends StatefulWidget {
  const MyMainTaskFive({Key? key}) : super(key: key);

  @override
  State<MyMainTaskFive> createState() => _MyMainTaskFiveState();
}

class _MyMainTaskFiveState extends State<MyMainTaskFive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demo Of URL Launcher',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(
                20,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyCallTaskFive(),
                    ),
                  );
                },
                child: Text(
                  'Call via URL Launcher',
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => MySmsTaskFive()),
                    ),
                  );
                },
                child: Text(
                  'Send sms via URL LAUNCHER',
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MySendEmail(),
                    ),
                  );
                },
                child: Text(
                  'Mail via URL Launcher',
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyShareTask(),
                    ),
                  );
                },
                child: Text(
                  'Share via URL Launcher',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
