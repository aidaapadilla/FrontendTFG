import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../services/localStorage.dart';

DetailsModel detailsmodelfromJson(Map<String, dynamic> prm) =>
    DetailsModel.fromJson(prm);

class DetailsModel {
  String token;
  String id;

  DetailsModel({required this.token, required this.id});

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      DetailsModel(token: json['token'], id: json['id']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['token'] = token;
    data['id'] = id;

    return data;
  }
}

class UserServices extends ChangeNotifier {
  User _userData = User(name: "", id: "", password: "", email: "", points: 0);

  User get userData => _userData;

  void setUserData(User userData) {
    _userData = userData;
  }

  Future<List<User>?> getUsers() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/users/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return listuserFromJson(json);
    }
    return null;
  }

  Future<int> checkemail(User user) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/users/checkemail');
    var userJS = json.encode(user.toJson());
    var response = await client.put(uri,
        headers: {'content-type': 'application/json'}, body: userJS);
    if (response.statusCode == 200) {
      return 1;
    } else {
      return 2;
    }
  }

  Future<int> loginUser(User user) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/auth/login');
    var userJS = json.encode(user.logintoJson());
    var response = await client.post(uri,
        headers: {'content-type': 'application/json'}, body: userJS);
    if (response.statusCode == 200) {
      DetailsModel parametres = new DetailsModel(token: "", id: "");

      final Map<String, dynamic> map = json.decode(response.body);
      DetailsModel det = detailsmodelfromJson(map);

      // StorageTFG().addItemsToLocalStorage(det.token, det.id, user.password);

      return 1;
    } else if (response.statusCode == 402) {
      return 2;
    } else {
      return 3;
    }
  }
}
