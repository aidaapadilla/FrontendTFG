// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:frontend_tfg/services/localStorage.dart';
import 'package:flutter/material.dart';
import '../models/game.dart';
import 'package:http/http.dart' as http;

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

class GameServices extends ChangeNotifier {
  // ignore: prefer_final_fields
  Game _gameData = Game(
      id: "",
      student: "",
      airportCapacity: "",
      windRose: "",
      location: "",
      referenceTemperature: 0);

  Game get gameData => _gameData;

  void setParkingData(Game gameData) {
    _gameData = gameData;
  }

  Future<void> createGame(Game game) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/games/');
    var gameJS = json.encode(game.toJson());
    var response = await client.post(uri,
        headers: {
          'content-type': 'application/json',
          //'x-access-token': StorageAparcam().getToken()
        },
        body: gameJS);
    if (response.statusCode == 200) {
      return print("game created");
    } else {
      return print("ERROR: can't create the games spot");
    }
  }
}
