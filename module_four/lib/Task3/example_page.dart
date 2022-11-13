import 'package:flutter/material.dart';
import 'package:module_four/Task3/home_page.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Route'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(
                        counter: 0,
                        onPress: () {},
                      ),
                    ),
                  );
                },
                child: Text(
                  'Goto Home',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
