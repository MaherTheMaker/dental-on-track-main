// To parse this JSON data, do
//
//     final treatmentPlanResponse = treatmentPlanResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
List<TreatmentPlanResponse> treatmentPlanResponseFromMap(String str) => List<TreatmentPlanResponse>.from(json.decode(str).map((x) => TreatmentPlanResponse.fromMap(x)));

String treatmentPlanResponseToMap(List<TreatmentPlanResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TreatmentPlanResponse {
  TreatmentPlanResponse({
    required this.id,
    required this.toothProcedures,
    required this.createdAt,
    required this.notes,
  });

  int? id;
  List<ToothProcedure>? toothProcedures;
  String? createdAt;
  String? notes;

  factory TreatmentPlanResponse.fromJson(String str) => TreatmentPlanResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TreatmentPlanResponse.fromMap(Map<String, dynamic> json) => TreatmentPlanResponse(
    id: json["id"] == null ? null : json["id"],
    toothProcedures: json["toothProcedures"] == null ? null : List<ToothProcedure>.from(json["toothProcedures"].map((x) => ToothProcedure.fromMap(x))),
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    notes: json["notes"] == null ? null : json["notes"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "toothProcedures": toothProcedures == null ? null : List<dynamic>.from(toothProcedures!.map((x) => x.toMap())),
    "createdAt": createdAt == null ? null : createdAt,
    "notes": notes == null ? null : notes,
  };
}

class ToothProcedure {
  ToothProcedure({
   required this.id,
   required this.patientTooth,
   required this.price,
   required this.notes,
   required this.done,
   required this.procedure,
   required this.paid,
  });

  int? id;
  PatientTooth? patientTooth;
  double? price;
  String? notes;
  bool? done;
  Procedure? procedure;
  bool? paid;

  factory ToothProcedure.fromJson(String str) => ToothProcedure.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ToothProcedure.fromMap(Map<String, dynamic> json) => ToothProcedure(
    id: json["id"] == null ? null : json["id"],
    patientTooth: json["patientTooth"] == null ? null : PatientTooth.fromMap(json["patientTooth"]),
    price: json["price"] == null ? null : json["price"].toDouble(),
    notes: json["notes"] == null ? null : json["notes"],
    done: json["done"] == null ? null : json["done"],
    procedure: json["procedure"] == null ? null : Procedure.fromMap(json["procedure"]),
    paid: json["paid"] == null ? null : json["paid"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "patientTooth": patientTooth == null ? null : patientTooth!.toMap(),
    "price": price == null ? null : price,
    "notes": notes == null ? null : notes,
    "done": done == null ? null : done,
    "procedure": procedure == null ? null : procedure!.toMap(),
    "paid": paid == null ? null : paid,
  };
}

class PatientTooth {
  PatientTooth({
    required this.id,
    required this.toothId,
    required this.patientId,
    required this.color,
    required this.status,
    required this.notes,
  });

  int? id;
  String? toothId;
  int? patientId;
  String? color;
  String? status;
  String? notes;

  factory PatientTooth.fromJson(String str) => PatientTooth.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatientTooth.fromMap(Map<String, dynamic> json) => PatientTooth(
    id: json["id"] == null ? null : json["id"],
    toothId: json["toothId"] == null ? null : json["toothId"],
    patientId: json["patientId"] == null ? null : json["patientId"],
    color: json["color"] == null ? null : json["color"],
    status: json["status"] == null ? null : json["status"],
    notes: json["notes"] == null ? null : json["notes"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "toothId": toothId == null ? null : toothId,
    "patientId": patientId == null ? null : patientId,
    "color": color == null ? null : color,
    "status": status == null ? null : status,
    "notes": notes == null ? null : notes,
  };
}

class Procedure {
  Procedure({
    required this.id,
    required this.pName,
    required this.defaultPrice,
    required this.defaultNumberOfAppointments,
    required this.notes,
  });

  int? id;
  String? pName;
  double? defaultPrice;
  int? defaultNumberOfAppointments;
  String? notes;

  factory Procedure.fromJson(String str) => Procedure.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Procedure.fromMap(Map<String, dynamic> json) => Procedure(
    id: json["id"] == null ? null : json["id"],
    pName: json["pName"] == null ? null : json["pName"],
    defaultPrice: json["defaultPrice"] == null ? null : json["defaultPrice"],
    defaultNumberOfAppointments: json["defaultNumberOfAppointments"] == null ? null : json["defaultNumberOfAppointments"],
    notes: json["notes"] == null ? null : json["notes"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "pName": pName == null ? null : pName,
    "defaultPrice": defaultPrice == null ? null : defaultPrice,
    "defaultNumberOfAppointments": defaultNumberOfAppointments == null ? null : defaultNumberOfAppointments,
    "notes": notes == null ? null : notes,
  };
}
