import 'package:flutter/material.dart';
import 'package:sqflite_first/UserService/UserService.dart';
import 'package:sqflite_first/model/Student.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  var _userService = UserService();
  var _myKey = GlobalKey<FormState>();
  var _sNameController = TextEditingController();
  var _sAgeController = TextEditingController();
  var name;
  var age;
  var myStudent = Student();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _myKey,
          child: Column(
            children: [
              TextFormField(
                controller: _sNameController,
                decoration: InputDecoration(labelText: 'Enter Student Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Fill Field';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 28,
              ),
              TextFormField(
                controller: _sAgeController,
                decoration: InputDecoration(labelText: 'Enter Student Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Fill Field';
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        //name = _sNameController.text.toString();
                        // age = _sAgeController.text.toString();
                        if (_myKey.currentState!.validate()) {

                          myStudent.name = _sNameController.text;
                          myStudent.age = _sAgeController.text;
                          var res = await _userService.insertData(myStudent);
                          print('Data Added');
                          //return res;
                          Navigator.pop(context, res);
                        }
                      },
                      child: Text('Insert')),
                  ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
