// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Absent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Absent _$AbsentFromJson(Map<String, dynamic> json) => Absent(
      json['status'] as String,
      json['statusId'] as int,
      json['employee'] as String,
      json['user'] as String,
      json['assign'] as String,
      json['absentType'] as String,
      json['date'] as String,
      json['month'] as String,
      json['year'] as int,
      json['startDate'] as String,
      json['endDate'] as String,
      json['startHour'] as String,
      json['endHour'] as String,
      json['reason'] as String?,
      json['type'] as int,
      json['issueId'] as int,
    );

Map<String, dynamic> _$AbsentToJson(Absent instance) => <String, dynamic>{
      'status': instance.status,
      'statusId': instance.statusId,
      'employee': instance.employee,
      'user': instance.user,
      'assign': instance.assign,
      'absentType': instance.absentType,
      'date': instance.date,
      'month': instance.month,
      'year': instance.year,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startHour': instance.startHour,
      'endHour': instance.endHour,
      'reason': instance.reason,
      'type': instance.type,
      'issueId': instance.issueId,
    };
