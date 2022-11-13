import 'package:sqflite/sqflite.dart';
import 'package:sqflite_first/connection/DatabaseConnection.dart';

class Repository{
  late DatabaseConnection _connection;
  static Database? _database;

  Repository(){
    _connection = DatabaseConnection();
  }

  Future<Database?> get database async{
    if(_database==null){
       _database = await _connection.setDatabase();
      return _database;
    }
    else{
      return _database;
    }
  }

  insertData(table,values) async {
    var db = await database;
    return await db?.insert(table, values);
  }

  readData(table) async {
    var db = await database;
    return await db?.query(table);
  }

  updateData(table,values) async {
    var db = await database;
    return await db?.update(table, values,where: 'id = ?',whereArgs: [values['id']]);
  }

  deleteData(table,itemId) async {
    var db = await database;
    return await db?.rawDelete('delete from $table where id = $itemId');
  }
}