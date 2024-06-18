// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../models/teacher.dart';
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

class TeacherServices extends ChangeNotifier {
  // ignore: prefer_final_fields
  Teacher _teacherData =
      Teacher(id: "", name: "", password: "", email: "", myStudents: []);
  Teacher get studentData => _teacherData;

  void setTeacherData(Teacher teacherData) {
    _teacherData = teacherData;
  }

  Future<int> loginTeacher(Teacher teacher) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/auth/login');
    var teacherJS = json.encode(teacher.LogintoJson());
    var response = await client.post(uri,
        headers: {'content-type': 'application/json'}, body: teacherJS);
    if (response.statusCode == 200) {
      return 1;
    } else if (response.statusCode == 402) {
      return 2;
    } else {
      return 3;
    }
  }

  Future<List<Teacher>?> getTeachers() async {
    var client = http.Client();
    var uri = Uri.parse('http://127.0.0.1:5432/api/teachers/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return listteacherFromJson(json);
    }
    return null;
  }

  Future<List<Teacher>?> getStudents() async {
    //No es aquesta list no??
    var client = http.Client();
    var uri = Uri.parse('127.0.0.1:5432/api/teachers/students');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return listteacherFromJson(json);
    }
    return null;
  }

  Future<Teacher?> getOneTeacher(Teacher teacher) async {
    var client = http.Client();
    var id = teacher.id;
    var uri = Uri.parse('http://localhost:5432/api/teachers/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> map = json.decode(response.body);
      Teacher teacher = teacherFromJson(map);
      return teacher;
    }
    return null;
  }

  Future<void> deleteTeacher(Teacher teacher) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/teachers/');
    var teacherJS = json.encode(teacher.toJson());
    var response = await client.delete(uri,
        headers: {
          'content-type': 'application/json',
        },
        body: teacherJS);
    if (response.statusCode == 200) {
      return print("Account deleted");
    } else {
      return print("ERROR: can't delete the account");
    }
  }
}
