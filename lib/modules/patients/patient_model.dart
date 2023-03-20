// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

List<Patient> patientFromJson(String str) => List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

String patientToJson(List<Patient> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patient {
  Patient({
    this.id,
    this.fullName,
    this.gender,
    this.phoneNumber,
    this.email,
    this.address,
    this.age,
    this.deciduousTeeth,
    this.familyStatus,
    this.balance,
    this.discountType,
    this.lastVisitToADoctor,
    this.careWays,
    this.habits,
    this.gallery,
    this.filesList,
    this.medHistoryList,
    this.appointmentsList,
    this.diagnosed,

  });

  int? id;
  String? fullName;
  String? gender;
  String? phoneNumber;
  String? email;
  String? address;
  int? age;
  bool? deciduousTeeth;
  String? familyStatus;
  double? balance;
  String? discountType;
  dynamic lastVisitToADoctor;
  String? careWays;
  String? habits;
  List<dynamic>? gallery;
  List<dynamic>? filesList;
  List<dynamic>? medHistoryList;
  List<dynamic>? appointmentsList;
  bool? diagnosed;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["id"],
    fullName: json["fullName"],
    gender: json["gender"],
    phoneNumber: json["phoneNumber"],
    email: json["email"] == null ? null : json["email"],
    address: json["address"] == null ? null : json["address"],
    age: json["age"],
    deciduousTeeth: json["deciduousTeeth"] == null ? null : json["deciduousTeeth"],
    familyStatus: json["familyStatus"] == null ? null : json["familyStatus"],
    balance: json["balance"],
    discountType: json["discountType"] == null ? null : json["discountType"],
    lastVisitToADoctor: json["lastVisitToADoctor"],
    careWays: json["careWays"] == null ? null : json["careWays"],
    habits: json["habits"] == null ? null : json["habits"],
    gallery: List<dynamic>.from(json["gallery"].map((x) => x)),
    filesList: List<dynamic>.from(json["filesList"].map((x) => x)),
    medHistoryList: List<dynamic>.from(json["medHistoryList"].map((x) => x)),
    appointmentsList: List<dynamic>.from(json["appointmentsList"].map((x) => x)),
    diagnosed: json["diagnosed"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "gender": gender,
    "phoneNumber": phoneNumber,
    "email": email == null ? null : email,
    "address": address == null ? null : address,
    "age": age,
    "deciduousTeeth": deciduousTeeth == null ? null : deciduousTeeth,
    "familyStatus": familyStatus == null ? null : familyStatus,
    "balance": balance,
    "discountType": discountType == null ? null : discountType,
    "lastVisitToADoctor": lastVisitToADoctor,
    "careWays": careWays == null ? null : careWays,
    "habits": habits == null ? null : habits,
    "gallery": List<dynamic>.from(gallery!.map((x) => x)),
    "filesList": List<dynamic>.from(filesList!.map((x) => x)),
    "medHistoryList": List<dynamic>.from(medHistoryList!.map((x) => x)),
    "appointmentsList": List<dynamic>.from(appointmentsList!.map((x) => x)),
    "diagnosed": diagnosed,

  };
}
