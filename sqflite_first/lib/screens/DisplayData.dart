import 'package:flutter/material.dart';
import 'package:sqflite_first/UserService/UserService.dart';
import 'package:sqflite_first/model/Student.dart';
import 'package:sqflite_first/screens/AddStudent.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({Key? key}) : super(key: key);

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  var _userService = UserService();

  late List<Student> myStudentList;

  _getAllData() async {
    var students = await _userService.readData();
    myStudentList = [];
    students.forEach((myAllData) {

      setState(() {
        var studentI = Student();
        studentI.id = myAllData['id'];
        studentI.name = myAllData['nameS'];
        studentI.age = myAllData['ageS'];
        myStudentList.add(studentI);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Student Information'),
      ),
      body: ListView.builder(
        itemCount: myStudentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myStudentList[index].name ?? ''),
            subtitle: Text(myStudentList[index].age ?? 'A'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStudent(),
            ),
          ).then(
            (value) => {
              if (value != null) {_getAllData()}
            },
          )
        },
      ),
    );
  }
}
