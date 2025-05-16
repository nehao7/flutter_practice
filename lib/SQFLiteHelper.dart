
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SQFLiteHelper{
  // all methods in this class are asynchronous because they involve I/O operations.
  Future<Database> openMyDatabase() async {
    if (!Platform.isAndroid && !Platform.isIOS) {
      //  Initialize FFI for desktop platforms
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    //  Use correct getDatabasesPath depending on platform
    final dbPath = Platform.isAndroid || Platform.isIOS
        ? await getDatabasesPath()
        : await databaseFactory.getDatabasesPath();

    final path = join(dbPath, 'myDatabase.db');

    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) {
          db.execute('CREATE TABLE todoList(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, status  INTEGER)');        },
      ),
    );
  }

  // Future<Database> openMyDatabase() async{
  //   // Desktop or console (non-mobile)
  //   if (!Platform.isAndroid && !Platform.isIOS) {
  //     // Initialize FFI
  //     sqfliteFfiInit();
  //
  //     // Set the database factory to FFI for desktop
  //     databaseFactory = databaseFactoryFfi;
  //
  //     final dbPath = await databaseFactory.getDatabasesPath();
  //     final path = join(dbPath, 'myToDoDatabase.db');
  //
  //     return await databaseFactory.openDatabase(path, options: OpenDatabaseOptions(
  //       version: 1,
  //       onCreate: (db, version) {
  //         db.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT)');
  //       },
  //     ));
  //   }
  //
  //   // Mobile (Android/iOS)
  //   final dbPath = await getDatabasesPath();
  //   final path = join(dbPath, 'myToDoDatabase.db');
  //
  //   return await openDatabase(
  //     path,
  //     version: 1,
  //     onCreate: (db, version) {
  //       db.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT)');
  //     },
  //   );
  //
  // }

  //192.168.10.78
  Future<void> insertTask(String title, bool status) async{
    //db is the instance of the database that we get from the openMyDatabase function.

    final db = await openMyDatabase();
    //after getting the database instance, we insert the task into the todoList table.
    //insert method takes three arguments: the name of the table, the data to be inserted, and the conflictAlgorithm.
    //data is a map with the column names as keys and the values to be inserted as values.
    //We use ConflictAlgorithm.replace to replace the task if it already exists.
    //here we don't need to insert the id column because it is set to autoincrement.
    db.insert('todoList', {
      'title':title,
      'status':status?1:0
      //We use 1 for true and 0 for false.
    },
    conflictAlgorithm: ConflictAlgorithm.replace
    );

  }
  Future<void> deleteTask(int id) async {
    final db= await openMyDatabase();
//delete method takes two arguments: the name of the table and the where clause.
    //we are using unique id for each task as the where clause to delete the task with the given id.
    db.delete('todoList', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateTask(int id , bool status) async{
    final db = await openMyDatabase();
    //update method takes four arguments: the name of the table, the data to be updated, the where clause, and the whereArgs.
    //In this case, we are updating the status of the task with the given id.
    db.update('todoList', {
      'status': status?1:0,

    },
    where: 'id=?',
      whereArgs: [id]
    );
  }

  Future<List<Map<String,dynamic>>> getTasks() async{
    final db = await openMyDatabase();
    //query method is used to get the tasks from the todoList table.
    //It takes the name of the table as an argument.
    //and returns a list of maps where each map represents a task.
    //like [{id: 1, title: 'Task 1', status: 1}, {id: 2, title: 'Task 2', status: 0}]
    return await db.query('todoList');
  }

}