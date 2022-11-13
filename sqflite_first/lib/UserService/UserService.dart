import 'package:sqflite_first/Repository/Repository.dart';
import 'package:sqflite_first/model/Student.dart';

class UserService{
  late Repository _repository;

  UserService(){
    _repository = Repository();
  }

  insertData(Student studentI) async{
    return await _repository.insertData('student', studentI.MyStudMap());
  }

  readData() async {
    return await _repository.readData('student');
  }

  updateData(Student studentI) async {
    return await _repository.updateData('student', studentI.MyStudMap());
  }

  deleteData(itemId) async{
    return await _repository.deleteData('student', itemId);
  }
}