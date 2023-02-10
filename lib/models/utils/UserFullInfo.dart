import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'User.dart';


part 'UserFullInfo.g.dart';

@immutable
@JsonSerializable()
class UserFullInfo {
  final int id;
  final int tracker_id;
  final int project_id;
  final String? subject;
  final String? description;
  final String? due_date;
 // final int category_id;
  final int status_id;
  final int assigned_to_id;
  final int priority_id;
//  final int fixed_version_id;
  final int author_id;
  final int lock_version;
  final String? created_on;
  final String? updated_on;
  final String? start_date;
  final int done_ratio;
 // final int parent_id;
  final String start_time;
  final String due_time;
//  final int root_id;
 // final int lft;
 // final int rgt;
  final int is_private;
  final String? closed_on;
  final int special_leave;
  final User? author;
  final User? user;
  final User? assign;


  UserFullInfo(
      this.id,
      this.tracker_id,
      this.project_id,
      this.subject,
      this.description,
      this.due_date,
     // this.category_id,
      this.status_id,
      this.assigned_to_id,
      this.priority_id,
     // this.fixed_version_id,
      this.author_id,
      this.lock_version,
      this.created_on,
      this.updated_on,
      this.start_date,
      this.done_ratio,
    //  this.parent_id,
      this.start_time,
      this.due_time,
    //  this.root_id,
     // this.lft,
    //  this.rgt,
      this.is_private,
      this.closed_on,
      this.special_leave,
      this.author,
      this.user,
      this.assign);

  factory
  UserFullInfo.fromJson(Map<String, dynamic> json)=> _$UserFullInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserFullInfoToJson(this);
}

