// const GameSchema = new Schema({
//     user: { type: Schema.Types.ObjectId, ref: "User" },
//     windRose: String,
//     airportCapacity: String,
//     Location: String,
//     referenceTemperature: Number
// });

import 'dart:convert';

class Game {
  Game(
      {required this.id,
      required this.student,
      required this.airportCapacity,
      required this.windRose,
      required this.location,
      required this.referenceTemperature});
  String id;
  String student;
  String windRose;
  String airportCapacity;
  String location;
  int referenceTemperature;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
      id: json["_id"],
      student: json["student"],
      windRose: json["windRose"],
      airportCapacity: json["airportCapacity"],
      location: json["location"],
      referenceTemperature: json["referenceTemperature"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "student": student,
        "windRose": windRose,
        "airportCapacity": airportCapacity,
        "location": location,
        "referenceTemperature": referenceTemperature
      };
}
