// To parse this JSON data, do
//
//     final financialDashboard = financialDashboardFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class FinancialDashboard {
  FinancialDashboard({
    required this.allUnpaid,
    required this.allExpenses,
    required this.allRevenue,
  });

  double allUnpaid;
  double allExpenses;
  double allRevenue;

  factory FinancialDashboard.fromJson(String str) => FinancialDashboard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FinancialDashboard.fromMap(Map<String, dynamic> json) => FinancialDashboard(
    allUnpaid: json["allUnpaid"] == null ? null : json["allUnpaid"],
    allExpenses: json["allExpenses"] == null ? null : json["allExpenses"],
    allRevenue: json["allRevenue"] == null ? null : json["allRevenue"],
  );

  Map<String, dynamic> toMap() => {
    "allUnpaid": allUnpaid == null ? null : allUnpaid,
    "allExpenses": allExpenses == null ? null : allExpenses,
    "allRevenue": allRevenue == null ? null : allRevenue,
  };
}
