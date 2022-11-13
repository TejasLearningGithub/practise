import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyEdit extends StatefulWidget {
  String myName;
  final List<String> myList;
  int indexOfEditPage;

  MyEdit(
      {Key? key,
      required this.myName,
      required this.myList,
      required this.indexOfEditPage})
      : super(key: key);

  @override
  State<MyEdit> createState() => _MyEditState();
}

class _MyEditState extends State<MyEdit> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _taskEditController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskEditController.text = widget.myName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextFormField(
                  controller: _taskEditController,
                  onChanged: (value) => {
                    widget.myName = value,
                    // print('********${widget.myName}*********'),
                  },
                  //initialValue: '${widget.myName}',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      print('Success');
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        widget.myList[widget.indexOfEditPage] =
                            _taskEditController.text;
                        print(widget.myList);
                      });
                      print('Update Works');
                      // Navigator.pop(context);
                      Navigator.of(context).pop(widget.myList);
                    }
                  },
                  child: Text(
                    'Update',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
