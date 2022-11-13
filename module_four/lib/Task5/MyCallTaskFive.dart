import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class MyCallTaskFive extends StatefulWidget {
  const MyCallTaskFive({Key? key}) : super(key: key);

  @override
  State<MyCallTaskFive> createState() => _MyCallTaskFiveState();
}

class _MyCallTaskFiveState extends State<MyCallTaskFive> {
  TextEditingController _callController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calling By URL Launcher'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _callController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blue.shade500,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 48,
            ),
            ElevatedButton(
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber(_callController.text);
              },
              child: Text(
                'Call',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
