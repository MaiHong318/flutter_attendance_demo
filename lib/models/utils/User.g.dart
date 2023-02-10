// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['firstname'] as String,
      json['lastname'] as String,
      (json['total_paid_leave'] as num?)?.toDouble(),
      (json['number_days_off'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'total_paid_leave': instance.total_paid_leave,
      'number_days_off': instance.number_days_off,
    };
