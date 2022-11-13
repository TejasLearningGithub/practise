import 'package:flutter/material.dart';

const List<String> choices = <String>[
  "Item 1",
  "Item 2",
  "Item 3",
];

class MyContextMenu extends StatefulWidget {
  @override
  _ContextMenuState createState() => _ContextMenuState();
}

class _ContextMenuState extends State<MyContextMenu> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  String _selectedChoices = '';

  void _select(String choice) {
    setState(() {
      _selectedChoices = choice;
    });
    showSnackBar(choice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Context Menu'),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: _select,
            padding: EdgeInsets.zero,
            // initialValue: choices[_selection],
            itemBuilder: (BuildContext context) {
              return choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
    );
  }

  void showSnackBar(String choice) {
    final snackBarContent = SnackBar(
      content: Text(
        'Selected: $choice',
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    // _scaffoldkey.currentState.showSnackBar(snackBarContent);
  }
}
