// To parse this JSON data, do
//
//     final medicalHistory = medicalHistoryFromJson(jsonString);

import 'dart:convert';

List<MedicalHistory> medicalHistoryFromJson(String str) => List<MedicalHistory>.from(json.decode(str).map((x) => MedicalHistory.fromJson(x)));

String medicalHistoryToJson(List<MedicalHistory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicalHistory {
  MedicalHistory({
    this.illness,
    this.notes,
  });

  Illness? illness;
  String? notes;

  factory MedicalHistory.fromJson(Map<String, dynamic> json) => MedicalHistory(
    illness: Illness.fromJson(json["illness"]),
    notes: json["notes"] == null ? null : json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "illness": illness!.toJson(),
    "notes": notes == null ? null : notes,
  };
}

class Illness {
  Illness({
    this.id,
    this.name,
    this.gender,
    this.notes,
  });

  int? id;
  String? name;
  String? gender;
  String? notes;

  factory Illness.fromJson(Map<String, dynamic> json) => Illness(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
    notes: json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,
    "notes": notes,
  };
}
// To parse this JSON data, do
//
//     final illnesses = illnessesFromJson(jsonString);


List<Illnesses> illnessesFromJson(String str) => List<Illnesses>.from(json.decode(str).map((x) => Illnesses.fromJson(x)));

String illnessesToJson(List<Illnesses> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Illnesses {
  Illnesses({
    this.id,
    this.name,
    this.gender,
    this.notes,
  });

  int? id;
  String? name;
  String? gender;
  String? notes;

  factory Illnesses.fromJson(Map<String, dynamic> json) => Illnesses(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
    notes: json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,
    "notes": notes,
  };
}
