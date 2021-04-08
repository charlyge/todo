import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:todo/model/Todo.dart';
import 'package:path/path.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper()._internal();
  String tbTodo = "todo";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colDate = "date";
  String colPriority = "priority";
  static Database _db;

  DbHelper _internal() {
    if (dbHelper == null) {
      dbHelper = new DbHelper();
    }
  }

  // factory DbHelper() {
  //   return dbHelper;
  // }

  Future<Database> get db async {
    if(_db==null){
      _db = await intializeDb();
    }
    return _db;
  }

  Future<Database> intializeDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "todo.db";
    var dbTodos = await openDatabase(path, version: 1, onCreate: createDb);
    return dbTodos;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tbTodo($colId INTEGER PRIMARY KEY, $colTitle TEXT, $colDescription TEXT, $colDate TEXT,$colPriority INTEGER)");
  }

  Future<int> insertTodo(Todo todo) async{
    Database db = await this.db;
    var result = await db.insert(tbTodo, todo.topMap());
    return result;
  }
  
  Future<List> getTodos() async{
    Database db = await this.db;
    return await db.rawQuery("SELECT * from $tbTodo ORDER BY $colPriority ASC");
  }

  Future<int> getCount() async{
    Database db = await this.db;
    return  Sqflite.firstIntValue( await db.rawQuery("SELECT count (*) from $tbTodo"));
  }

  Future<int> updateTodo(Todo todo) async{
    Database db = await this.db;
    var result = await db.update(tbTodo, todo.topMap(),where: "$colId = ?",whereArgs: [todo.id]);
    return result;
  }
  Future<int> deleteaTodo(int id) async{
    Database db = await this.db;
    return  await db.delete("delete from $tbTodo where $colId = $id");
  }
}
