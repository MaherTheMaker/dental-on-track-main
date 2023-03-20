// To parse this JSON data, do
//
//     final expenses = expensesFromJson(jsonString);

import 'dart:convert';

List<Expenses> expensesFromJson(String str) => List<Expenses>.from(json.decode(str).map((x) => Expenses.fromJson(x)));

String expensesToJson(List<Expenses> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Expenses {
  Expenses({
    this.daoUserName,
    this.date,
    this.totalPrice,
    this.details,
    this.safeName,
  });

  String? daoUserName;
  String? date;
  double? totalPrice;
  String? details;
  String? safeName;

  factory Expenses.fromJson(Map<String, dynamic> json) => Expenses(
    daoUserName: json["daoUserName"],
    date: json["date"],
    totalPrice: json["totalPrice"],
    details: json["details"],
    safeName: json["safeName"],
  );

  Map<String, dynamic> toJson() => {
    "daoUserName": daoUserName,
    "date": date,
    "totalPrice": totalPrice,
    "details": details,
    "safeName": safeName,
  };
}
