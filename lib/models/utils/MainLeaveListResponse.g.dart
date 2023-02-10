// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainLeaveListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainLeaveListResponse _$MainLeaveListResponseFromJson(
        Map<String, dynamic> json) =>
    MainLeaveListResponse(
      GetLeaveListResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainLeaveListResponseToJson(
        MainLeaveListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
