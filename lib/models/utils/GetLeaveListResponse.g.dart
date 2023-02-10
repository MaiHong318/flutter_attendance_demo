// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetLeaveListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLeaveListResponse _$GetLeaveListResponseFromJson(
        Map<String, dynamic> json) =>
    GetLeaveListResponse(
      json['current_page'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => UserFullInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['last_page'] as int,
    );

Map<String, dynamic> _$GetLeaveListResponseToJson(
        GetLeaveListResponse instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
      'last_page': instance.last_page,
    };
