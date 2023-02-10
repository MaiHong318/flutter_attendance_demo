// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserFullInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFullInfo _$UserFullInfoFromJson(Map<String, dynamic> json) => UserFullInfo(
      json['id'] as int,
      json['tracker_id'] as int,
      json['project_id'] as int,
      json['subject'] as String?,
      json['description'] as String?,
      json['due_date'] as String?,
      json['status_id'] as int,
      json['assigned_to_id'] as int,
      json['priority_id'] as int,
      json['author_id'] as int,
      json['lock_version'] as int,
      json['created_on'] as String?,
      json['updated_on'] as String?,
      json['start_date'] as String?,
      json['done_ratio'] as int,
      json['start_time'] as String,
      json['due_time'] as String,
      json['is_private'] as int,
      json['closed_on'] as String?,
      json['special_leave'] as int,
      json['author'] == null
          ? null
          : User.fromJson(json['author'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      json['assign'] == null
          ? null
          : User.fromJson(json['assign'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserFullInfoToJson(UserFullInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tracker_id': instance.tracker_id,
      'project_id': instance.project_id,
      'subject': instance.subject,
      'description': instance.description,
      'due_date': instance.due_date,
      'status_id': instance.status_id,
      'assigned_to_id': instance.assigned_to_id,
      'priority_id': instance.priority_id,
      'author_id': instance.author_id,
      'lock_version': instance.lock_version,
      'created_on': instance.created_on,
      'updated_on': instance.updated_on,
      'start_date': instance.start_date,
      'done_ratio': instance.done_ratio,
      'start_time': instance.start_time,
      'due_time': instance.due_time,
      'is_private': instance.is_private,
      'closed_on': instance.closed_on,
      'special_leave': instance.special_leave,
      'author': instance.author,
      'user': instance.user,
      'assign': instance.assign,
    };
