// To parse this JSON data, do
//
//     final receipt = receiptFromJson(jsonString);

import 'dart:convert';

List<Receiptt> receiptFromJson(String str) => List<Receiptt>.from(json.decode(str).map((x) => Receiptt.fromJson(x)));

String receiptToJson(List<Receiptt> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Receiptt {
  Receiptt({
    this.id,
    this.userName,
    this.patientName,
    this.safeName,
    this.date,
    this.procedure,
    this.total,
    this.discount,
  });

  int? id;
  String? userName;
  String? patientName;
  String? safeName;
  String? date;
  List<dynamic>? procedure;
  double? total;
  bool? discount;

  factory Receiptt.fromJson(Map<String, dynamic> json) => Receiptt(
    id: json["id"],
    userName: json["userName"],
    patientName: json["patientName"],
    safeName: json["safeName"],
    date: json["date"],
    procedure: List<dynamic>.from(json["procedure"].map((x) => x)),
    total: json["total"].toDouble(),
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "patientName": patientName,
    "safeName": safeName,
    "date": date,
    "procedure": List<dynamic>.from(procedure!.map((x) => x)),
    "total": total,
    "discount": discount,
  };
}
