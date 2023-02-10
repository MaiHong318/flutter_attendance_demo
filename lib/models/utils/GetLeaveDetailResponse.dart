import 'package:flutter_attendance_demo/models/utils/UserFullInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';


part 'GetLeaveDetailResponse.g.dart';

@immutable
@JsonSerializable()
class GetLeaveDetailResponse {
  final UserFullInfo data;

  GetLeaveDetailResponse(this.data);

  factory
  GetLeaveDetailResponse.fromJson(Map<String, dynamic> json)=> _$GetLeaveDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLeaveDetailResponseToJson(this);
}