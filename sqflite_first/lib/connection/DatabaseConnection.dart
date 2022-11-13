

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseConnection {


  Future<Database> setDatabase() async {

    var directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path,'myDB11');
    var myDatabase = await openDatabase(path,version: 1,onCreate: _createTable);
    return myDatabase;
  }

  Future<void> _createTable(Database database,int version) async {
    String sql = 'create table student(id INTEGER PRIMARY KEY AUTOINCREMENT,nameS TEXT,ageS TEXT)';
    await database.execute(sql);
  }
}