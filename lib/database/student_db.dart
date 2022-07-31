import 'package:local_database1_project/model/student_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StudentDbHelper {
  static Database? database;
  static Future<Database> getDb() async {
    if (database == null) {
      database = await openDatabase(
        join(await getDatabasesPath(), StudentModel.dbname),
        onCreate: (db, version) {
          db.execute(StudentModel.create_table);
          // print('******************OnCreate^^^^^^^^^^^^^^^^^^^^^^^^^ ');
        },
        onUpgrade: (db, oldVersion, newVersion) {
          if (oldVersion != newVersion) {
            db.execute(StudentModel.drop_table);
            db.execute(StudentModel.create_table);
          }
        },
        version: 1,
      );
      return Future.value(database);
    } else {
      return Future.value(database);
    }
  }
}
