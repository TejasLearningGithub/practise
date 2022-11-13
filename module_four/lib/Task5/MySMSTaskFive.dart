import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class MySmsTaskFive extends StatefulWidget {
  const MySmsTaskFive({Key? key}) : super(key: key);

  @override
  State<MySmsTaskFive> createState() => _MySmsTaskFiveState();
}

class _MySmsTaskFiveState extends State<MySmsTaskFive> {
  TextEditingController _smsContent = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sending SMS Intent',
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _mobileNumber,
                decoration: InputDecoration(
                    hintText: 'please enter mobile number',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.purple.shade900,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _smsContent,
                decoration: InputDecoration(
                    hintText: 'please enter content',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.purple.shade900,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  launch('sms:${_mobileNumber.text}?body=${_smsContent.text}');
                },
                child: Text(
                  'Send SMS',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
