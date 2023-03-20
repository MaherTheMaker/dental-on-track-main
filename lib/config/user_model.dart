

import 'dart:convert';

import 'package:dental_on_track/config/secure_storage.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.jwtResponse,
    this.username,
    this.role,
  });

  JwtResponse? jwtResponse;
  String? username;
  String? role;

  factory User.fromJson(Map<String, dynamic> json) => User(
    jwtResponse: JwtResponse.fromJson(json["jwtResponse"]),
    username: json["username"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "jwtResponse": jwtResponse!.toJson(),
    "username": username,
    "role": role,
  };
  static late SecureStorage secureStorage;

  saveData() async {
    secureStorage = SecureStorage();
    secureStorage.storeValue('username', username);
    secureStorage.storeValue('role', role);
    secureStorage.storeValue('token', jwtResponse!.token);
  }

  updateData() {
    secureStorage = SecureStorage();
    secureStorage.storeValue('username', username);
    secureStorage.storeValue('role', role);
    secureStorage.storeValue('token', jwtResponse!.token);

  }
  Future<User> readData() async{
    secureStorage = SecureStorage();
    User user;
    String? token=await secureStorage.readValue('token');
    String? username=await secureStorage.readValue('username') ;
    String? role=await secureStorage.readValue('role');
    JwtResponse jwt=new JwtResponse(token: token);


    user=User(
      username: username,
      role: role,
      jwtResponse:jwt
    );
    return user;
  }
  Future<String> readToken() async {
    secureStorage = SecureStorage();
    String? token = await secureStorage.readValue('token');
    return token!;
  }
  static clearToken() async {
    secureStorage.deleteValue('token');
  }
  static clearData() async {
    secureStorage.deleteValue('token');
    secureStorage.deleteValue('username');
    secureStorage.deleteValue('role');

  }
}

class JwtResponse {
  JwtResponse({
    this.token,
  });

  String? token;

  factory JwtResponse.fromJson(Map<String, dynamic> json) => JwtResponse(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}

