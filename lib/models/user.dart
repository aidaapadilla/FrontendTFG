import 'dart:convert';

List<User> listuserFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

User userFromJson(Map<String, dynamic> str) => User.fromJson(str);

List<User> usersFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User(
      {this.id = "",
      required this.name,
      required this.password,
      required this.email,
      required this.points});
  String id;
  String name;
  String password;
  String email;
  int points;

  void setemail(String email) {
    this.email = email;
  }

  void setpoints(int points) {
    this.points = points;
  }

  void setpass(String pass) {
    password = pass;
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        password: "",
        email: json["email"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "password": password,
        "email": email,
        "points": points,
      };

  Map<String, dynamic> logintoJson() => {
        "password": password,
        "email": email,
      };
}
