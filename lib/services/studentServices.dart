// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../models/student.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

DetailsModel detailsmodelfromJson(Map<String, dynamic> prm) =>
    DetailsModel.fromJson(prm);

class DetailsModel {
  String id;

  DetailsModel({required this.id});

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      DetailsModel(id: json['id']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;

    return data;
  }
}

class StudentServices extends ChangeNotifier {
  // ignore: prefer_final_fields
  Student _studentData = Student(id: "", name: "", password: "", email: "");
  Student get studentData => _studentData;

  void setStudentData(Student studentData) {
    _studentData = studentData;
  }

  Future<int> loginUser(Student student) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/auth/login');
    var studentJS = json.encode(student.LogintoJson());
    var response = await client.post(uri,
        headers: {'content-type': 'application/json'}, body: studentJS);
    if (response.statusCode == 200) {
      // DetailsModel parametres = new DetailsModel(id: "");

      // final Map<String, dynamic> map = json.decode(response.body);
      // DetailsModel det = detailsmodelfromJson(map);

      // StorageAparcam().addItemsToLocalStorage(det.token, det.id, user.password);

      return 1;
    } else if (response.statusCode == 402) {
      return 2;
    } else {
      return 3;
    }
  }

  Future<List<Student>?> getStudents() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/students/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return liststudentFromJson(json);
    }
    return null;
  }

  Future<Student?> getOneStudent(Student student) async {
    var client = http.Client();
    var id = student.id;
    var uri = Uri.parse('http://localhost:5432/api/students/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> map = json.decode(response.body);
      Student student = studentFromJson(map);
      return student;
    }
    return null;
  }

  Future<void> deleteStudent(Student student) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/students/');
    var userJS = json.encode(student.toJson());
    var response = await client.delete(uri,
        headers: {
          'content-type': 'application/json',
        },
        body: userJS);
    if (response.statusCode == 200) {
      return print("Account deleted");
    } else {
      return print("ERROR: can't delete the account");
    }
  }
}
