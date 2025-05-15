
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQFLiteHelper{

  // Future<Database> openMyDatabase() async {
  //   return await openDatabase(
  //     // join method is used to join the path of the database with the path of the app's document directory.
  //       join(await getDatabasesPath(), 'myToDoDatabase.db'),
  //       // The version of the database. This is used to manage database schema changes.
  //       version: 1,
  //       // onCreate is a callback function that is called ONLY when the database is created for the first time.
  //       onCreate: (db, version) {
  //         return db.execute(
  //           'CREATE TABLE todoList(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, status  INTEGER)',
  //         );
  //         //Here we are creating a table named todoList with three columns: id, title, and status.
  //         //The id column is the primary key and is set to autoincrement.
  //         //We use INTEGER for the status column because SQLite does not have a boolean data type.
  //         //Instead, we use 0 for false and 1 for true.
  //       });
  // }
  
  Future<Database> openMyDatabase() async{
    return await openDatabase(
      join(await getDatabasesPath(),'myDatabase.db'),version: 1,
      onCreate: (db,version){
        return db.execute('CREATE TABLE todoList(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, status  INTEGER)');
      }
    );
  }

}