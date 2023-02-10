import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';


part 'User.g.dart';

@immutable
@JsonSerializable()
class User {
  final int id;
  final String firstname;
  final String lastname;
  final double? total_paid_leave;
  final double? number_days_off;
 // final int file_id;
//  final int count_noti_unread;
 // final int hr;

  User(this.id, this.firstname, this.lastname, this.total_paid_leave,
      this.number_days_off,
     // this.file_id,
     // this.count_noti_unread,
     // this.
  );

  factory
  User.fromJson(Map<String, dynamic> json)=> _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


