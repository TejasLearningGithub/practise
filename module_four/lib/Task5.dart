import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTaskFive extends StatefulWidget {
  const MyTaskFive({Key? key}) : super(key: key);

  @override
  State<MyTaskFive> createState() => _MyTaskFiveState();
}

class _MyTaskFiveState extends State<MyTaskFive> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController txtController = TextEditingController();
  List<String> titles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 5'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: txtController,
              decoration: InputDecoration(hintText: 'Enter Item'),
              validator: (myValueText) {
                if (myValueText!.isEmpty)
                  return 'please enter value';
                else
                  return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    titles.insert(0, txtController.text.toString());
                  });
                }
              },
              child: Text('Add Item To List View'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(titles[index]),
                      onTap: () => showAlertDialog(context, index),
                      onLongPress: () => contextMenu(context));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(titles[index]),
        );
      },
    );
  }

  contextMenu(BuildContext context) {
   
    // const List<String> choices = <String>[
    //   "Delete",
    //   "Edit",
    //   "Exit",
    // ];
    // String _selectedChoices = '';

    // void _select(String choice) {
    //   setState(() {
    //     _selectedChoices = choice;
    //   });
    // }

    // PopupMenuButton(
    //   icon: Icon(Icons.more_vert),
    //   //onSelected: _select,
    //   padding: EdgeInsets.zero,
    //   // initialValue: choices[_selection],

    //   itemBuilder: (BuildContext context) {
    //     return choices.map((String choice) {
    //       return PopupMenuItem<String>(
    //         value: choice,
    //         child: Text(choice),
    //       );
    //     }).toList();
    //   },
    // );
  }
}
