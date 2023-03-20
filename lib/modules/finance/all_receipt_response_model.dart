// To parse this JSON data, do
//
//     final allReceiptsResponse = allReceiptsResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AllReceiptsResponse {
  AllReceiptsResponse({
    required this.id,
    required this.userName,
    required this.patientName,
    required this.safeName,
    required this.date,
    required this.procedure,
    required this.total,
    required this.discount,
  });

  int id;
  String userName;
  String patientName;
  String safeName;
  DateTime date;
  List<int> procedure;
  double total;
  bool discount;

  factory AllReceiptsResponse.fromJson(String str) => AllReceiptsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllReceiptsResponse.fromMap(Map<String, dynamic> json) => AllReceiptsResponse(
    id: json["id"] == null ? null : json["id"],
    userName: json["userName"] == null ? null : json["userName"],
    patientName: json["patientName"] == null ? null : json["patientName"],
    safeName: json["safeName"] == null ? null : json["safeName"],
    date:  DateTime.parse(json["date"]),
    procedure:  List<int>.from(json["procedure"].map((x) => x)),
    total: json["total"] == null ? null : json["total"],
    discount: json["discount"] == null ? null : json["discount"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "userName": userName == null ? null : userName,
    "patientName": patientName == null ? null : patientName,
    "safeName": safeName == null ? null : safeName,
    "date": date == null ? null : date,
    "procedure": procedure == null ? null : List<dynamic>.from(procedure.map((x) => x)),
    "total": total == null ? null : total,
    "discount": discount == null ? null : discount,
  };
}
