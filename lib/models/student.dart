// const StudentSchema = new Schema({
//     name: { type: String, required: true },
//     password: { type: String, required: true },
//     email: { type: String, unique: true, required: true }
// });
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<Student> liststudentFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

Student studentFromJson(Map<String, dynamic> str) => Student.fromJson(str);

List<Student> studentsFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  Student(
      {required this.id,
      required this.name,
      required this.password,
      required this.email,
      required this.teacher_id});
  String id;
  String name;
  String password;
  String email;
  String teacher_id;

  void setname(String name) {
    this.name = name;
  }

  void setpass(String password) {
    this.password = password;
  }

  void setemail(String email) {
    this.email = email;
  }

  void setTeacherID(teacher_id) {
    this.teacher_id = teacher_id;
  }

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["_id"],
        name: json["name"],
        password: json["password"],
        teacher_id: json["teacher_id"],
        email: json["email"],
      );
  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "password": password,
        "email": email,
        "teacher_id": teacher_id,
      };

  Map<String, dynamic> LogintoJson() => {
        "password": password,
        "email": email,
      };
}
