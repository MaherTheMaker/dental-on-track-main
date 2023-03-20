// To parse this JSON data, do
//
//     final patientsAppointments = patientsAppointmentsFromJson(jsonString);

import 'dart:convert';

List<PatientsAppointments> patientsAppointmentsFromJson(String str) => List<PatientsAppointments>.from(json.decode(str).map((x) => PatientsAppointments.fromJson(x)));

String patientsAppointmentsToJson(List<PatientsAppointments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientsAppointments {
  PatientsAppointments({
    this.id,
    this.date,
    this.startTime,
    this.endTime,
    this.notes,
    this.patientName,
  });

  int? id;
  DateTime? date;
  int? startTime;
  int? endTime;
  String? notes;
  String? patientName;

  factory PatientsAppointments.fromJson(Map<String, dynamic> json) => PatientsAppointments(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    startTime: json["startTime"],
    endTime: json["endTime"],
    notes: json["notes"],
    patientName: json["patientName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "startTime": startTime,
    "endTime": endTime,
    "notes": notes,
    "patientName": patientName,
  };
}
