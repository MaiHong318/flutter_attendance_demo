import 'package:flutter_attendance_demo/models/utils/GetLeaveListResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';


part 'MainLeaveListResponse.g.dart';

@immutable
@JsonSerializable()
class MainLeaveListResponse {
  final GetLeaveListResponse data;

  MainLeaveListResponse(this.data);

  factory
  MainLeaveListResponse.fromJson(Map<String, dynamic> json)=> _$MainLeaveListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MainLeaveListResponseToJson(this);
}