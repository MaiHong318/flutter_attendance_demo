// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetLeaveDetailResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLeaveDetailResponse _$GetLeaveDetailResponseFromJson(
        Map<String, dynamic> json) =>
    GetLeaveDetailResponse(
      UserFullInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetLeaveDetailResponseToJson(
        GetLeaveDetailResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
