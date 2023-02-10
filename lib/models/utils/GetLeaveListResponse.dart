import 'UserFullInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';


part 'GetLeaveListResponse.g.dart';

@immutable
@JsonSerializable()
class GetLeaveListResponse {
  final int current_page;
  final List<UserFullInfo> data;
  final int last_page;


  GetLeaveListResponse(this.current_page, this.data, this.last_page);

  factory
  GetLeaveListResponse.fromJson(Map<String, dynamic> json)=> _$GetLeaveListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLeaveListResponseToJson(this);
}


