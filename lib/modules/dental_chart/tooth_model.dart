// To parse this JSON data, do
//
//     final tooth = toothFromJson(jsonString);

import 'dart:convert';

List<Tooth> toothFromJson(String str) => List<Tooth>.from(json.decode(str).map((x) => Tooth.fromJson(x)));

String toothToJson(List<Tooth> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tooth {
  Tooth({
    this.id,
    this.toothId,
    this.patientId,
    this.color,
    this.status,
    this.notes,
  });

  int? id;
  String? toothId;
  int? patientId;
  dynamic color;
  String? status;
  dynamic notes;

  factory Tooth.fromJson(Map<String, dynamic> json) => Tooth(
    id: json["id"],
    toothId: json["toothId"],
    patientId: json["patientId"],
    color: json["color"],
    status: json["status"],
    notes: json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "toothId": toothId,
    "patientId": patientId,
    "color": color,
    "status": status,
    "notes": notes,
  };
}

