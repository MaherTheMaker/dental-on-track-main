// To parse this JSON data, do
//
//     final allExpensesResponse = allExpensesResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AllExpensesResponse {
  AllExpensesResponse({
    required this.daoUserName,
    required this.date,
    required this.totalPrice,
    required this.details,
    required this.safeName,
  });

  String daoUserName;
  DateTime date;
  double totalPrice;
  String details;
  String safeName;

  factory AllExpensesResponse.fromJson(String str) => AllExpensesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllExpensesResponse.fromMap(Map<String, dynamic> json) => AllExpensesResponse(
    daoUserName: json["daoUserName"] == null ? null : json["daoUserName"],
    date:  DateTime.parse(json["date"]),
    totalPrice: json["totalPrice"] == null ? null : json["totalPrice"],
    details: json["details"] == null ? null : json["details"],
    safeName: json["safeName"] == null ? null : json["safeName"],
  );

  Map<String, dynamic> toMap() => {
    "daoUserName": daoUserName == null ? null : daoUserName,
    "date": date == null ? null : date,
    "totalPrice": totalPrice == null ? null : totalPrice,
    "details": details == null ? null : details,
    "safeName": safeName == null ? null : safeName,
  };
}
