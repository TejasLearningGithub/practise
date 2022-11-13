import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:module_four/Task3/example_page.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.counter, required this.onPress})
      : super(key: key);

  int counter;
  Function onPress;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    print('****************Widget Lifecycle: initState');
    Fluttertoast.showToast(
        msg: 'init state-initialization',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.brown,
        textColor: Colors.black);
    _animationController = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    print('***************Widget Lifecycle: didChangeDependencies');
    Fluttertoast.showToast(
        msg: 'didChangeDependencies-dependencies change',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.brown,
        textColor: Colors.white);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    Fluttertoast.showToast(
        msg: 'update widget',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.brown,
        textColor: Colors.white);
    print('***************Widget Lifecycle: didUpdateWidget');
    if (widget.counter != oldWidget.counter) {
      print('******************Count has changed****************');
    }
  }

  @override
  void deactivate() {
    print('***************Widget Lifecycle: deactivate');
    Fluttertoast.showToast(
        msg: 'de-activate state-initialization',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.brown,
        textColor: Colors.white);
    super.deactivate();
  }

  @override
  void dispose() {
    print('***************Widget Lifecycle: dispose');
    Fluttertoast.showToast(
        msg: 'dispose',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.brown,
        textColor: Colors.white);
    _animationController!.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      widget.counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
      '*********build method is called',
    );
    Fluttertoast.showToast(
        msg: 'build method called',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.brown,
        textColor: Colors.white);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget Lifecycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${widget.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () => {widget.onPress},
              child: Text('Reset count'),
            ),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ExamplePage()),
                );
              },
              child: Text('Navigate to new route'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
