import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';


part 'LoginResponse.g.dart';

@immutable
@JsonSerializable()
class LoginResponse {
  String success;
  String token;
  // String error;
  // User user;

  LoginResponse(this.success, this.token);  //, this.user

  factory
  LoginResponse.fromJson(Map<String, dynamic> json)=> _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);


}



