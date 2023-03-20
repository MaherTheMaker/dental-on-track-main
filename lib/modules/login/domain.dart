// To parse this JSON data, do
//
//     final domain = domainFromJson(jsonString);

import 'dart:convert';

import '../../config/clinic_model.dart';

Domain domainFromJson(String str) => Domain.fromJson(json.decode(str));

String domainToJson(Domain data) => json.encode(data.toJson());

class Domain {
  Domain({
    this.id,
    this.clinic,
    this.domain,
  });

  int? id;
  Clinic? clinic;
  String? domain;

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
    id: json["id"],
    clinic: Clinic.fromJson(json["clinic"]),
    domain: json["domain"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "clinic": clinic!.toJson(),
    "domain": domain,
  };
}


