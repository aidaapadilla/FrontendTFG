// const TeacherSchema = new Schema({
//     name: { type: String, required: true },
//     password: { type: String, required: true },
//     email: { type: String, unique: true, required: true },
//     myStudents: [{ type: Schema.Types.ObjectId, ref: 'Student' }] // bookings
// });
import 'dart:convert';

List<Teacher> listteacherFromJson(String str) =>
    List<Teacher>.from(json.decode(str).map((x) => Teacher.fromJson(x)));

Teacher teacherFromJson(Map<String, dynamic> str) => Teacher.fromJson(str);

List<Teacher> teachersFromJson(String str) =>
    List<Teacher>.from(json.decode(str).map((x) => Teacher.fromJson(x)));

String teacherToJson(List<Teacher> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Teacher {
  Teacher(
      {required this.id,
      required this.name,
      required this.password,
      required this.email,
      required this.myStudents});
  String id;
  String name;
  String password;
  String email;
  List<dynamic>? myStudents;

  void setname(String name) {
    this.name = name;
  }

  void setpassword(String password) {
    this.password = password;
  }

  void setemail(String email) {
    this.email = email;
  }

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["_id"],
        name: json["name"],
        password: "",
        email: json["email"],
        myStudents: json["myStudents"],
      );
  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "password": password,
        "email": email,
        "myStudents": myStudents,
      };

  // ignore: non_constant_identifier_names
  Map<String, dynamic> LogintoJson() => {
        "password": password,
        "email": email,
      };
}
