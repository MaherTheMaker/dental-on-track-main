import 'package:dental_on_track/config/secure_storage.dart';
import 'package:dental_on_track/config/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class Config {
  static late var headers;
  static late bool isSigned=SecureStorage.flutterSecureStorage.read(key: "signed in")=="true";
  static var client = http.Client();
  static var tokenn='eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhaGFhYWFhbTk4IiwiZXhwIjoxNjU0NzM1OTg2LCJpYXQiOjE2NTQ3MTc5ODZ9.0k5Ps3oITed88tq9-jp8gGYKQ8LAFDkZpW9Qi3jMycXXMd9lqIdlhqDW3uGJVkzY0c3CCa7lKMEpeLZ6EPCq6A';
  static late var token;
  static late User user;

  static late Dio dio;


  //--------------------domain name ---------------------------------------
  static var publicDomainAddress = 'http://192.168.43.80:8080';
  static var newDomainAddress ;
  //--------------------Home page  ---------------------------------------

  //--------------------Topics ---------------------------------------

  //--------------------Auth ---------------------------------------
  static var login='/authenticate';
  static var signUp='/clinicPlan/CreateClinic';
  static var getPlans='/plan/all';
  static var addPlan='/clinic/requestForPlan';
  static var getDomain='/clinicPlan/clinicDomain/';
  static var getPatients='/patient/all';
  static var addPatient='/patient/save';
  static var getProcedures='/Procedure/AllProcedure';
  static var addProcedure='/Procedure/addProcedure';
  static var createUser='/clinic/createUser/';
  static var getPatientAppointments='/Appointment/';
  static var getAllIllnesses='/clinic/GetAllIllnesses';
  static var getTeeth='/patient/';



}