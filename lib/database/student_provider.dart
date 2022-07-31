import 'package:local_database1_project/database/student_db.dart';
import 'package:local_database1_project/model/student_model.dart';

Future<bool> insertData(
  StudentModel model,
) async {
  var db = await StudentDbHelper.getDb();
  var result = await db.insert(StudentModel.table_name, model.toMap(model));
  print('*************************DB CREATED*******************');
  if (result < 0) {
    return false;
  }
  return true;
}

Future<bool> updateData(StudentModel model) async {
  var db = await StudentDbHelper.getDb();
  int result = await db.update(StudentModel.table_name, model.toMap(model),
      where: '${StudentModel.key_rollNo} = ?', whereArgs: [model.rollNo]);
  if (result < 0) {
    return false;
  } else {
    return true;
  }
}

Future<bool> deleteData(StudentModel model) async {
  var db = await StudentDbHelper.getDb();
  int result = await db.delete(StudentModel.table_name,
      where: 'roll_no = ?', whereArgs: [model.rollNo]);
  if (result < 0) {
    return false;
  } else {
    return true;
  }
}

Future<List<StudentModel>?> fetchData() async {
  var db = await StudentDbHelper.getDb();
  var list = await db.rawQuery(StudentModel.fetch_data);
  return list.map((map) => StudentModel.fromMap(map)).toList();
}
