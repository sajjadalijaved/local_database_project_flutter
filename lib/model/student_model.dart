class StudentModel {
  int rollNo;
  String name;
  String email;

  static const String dbname = 'student.db';
  static const String table_name = 'student_tb';

  static const String key_rollNo = 'roll_no';
  static const String key_name = 'name';
  static const String key_email = 'email';
  static const String create_table =
      'CREATE TABLE  $table_name($key_rollNo INTEGER PRIMARY KEY , $key_name TEXT, $key_email TEXT)';
  static const String drop_table = 'DROP TABLE IF EXISTS $table_name';

  static const String fetch_data = 'SELECT *FROM $table_name';

  StudentModel({
    required this.rollNo,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap(StudentModel model) {
    return {
      StudentModel.key_rollNo: model.rollNo,
      StudentModel.key_name: model.name,
      StudentModel.key_email: model.email
    };
  }

  static StudentModel fromMap(var map) {
    return StudentModel(
        name: map['name'], rollNo: map['roll_no'], email: map['email']);
  }
}
