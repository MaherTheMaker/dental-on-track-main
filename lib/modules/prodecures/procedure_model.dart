// To parse this JSON data, do
//
//     final procedure = procedureFromJson(jsonString);

import 'dart:convert';

List<Procedure> procedureFromJson(String str) => List<Procedure>.from(json.decode(str).map((x) => Procedure.fromJson(x)));

String procedureToJson(List<Procedure> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Procedure {
  Procedure({
    this.id,
    this.pName,
    this.defaultPrice,
    this.defaultNumberOfAppointments,
    this.notes,
  });

  int? id;
  String? pName;
  double? defaultPrice;
  int? defaultNumberOfAppointments;
  String? notes;

  factory Procedure.fromJson(Map<String, dynamic> json) => Procedure(
    id: json["id"],
    pName: json["pName"],
    defaultPrice: json["defaultPrice"],
    defaultNumberOfAppointments: json["defaultNumberOfAppointments"],
    notes: json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pName": pName,
    "defaultPrice": defaultPrice,
    "defaultNumberOfAppointments": defaultNumberOfAppointments,
    "notes": notes,
  };
}
