import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';


part 'Absent.g.dart';

@immutable
@JsonSerializable()
class Absent {
  final String status;
  final int statusId;
  final String employee;
  final String user;
  final String assign;
  final String absentType;
  final String date;
  final String month;
  final int year;
  final String startDate;
  final String endDate;
  final String startHour;
  final String endHour;
  final String? reason;
  final int type;
  final int issueId;

  Absent(this.status, this.statusId, this.employee, this.user, this.assign,
      this.absentType, this.date, this.month, this.year,
      this.startDate, this.endDate, this.startHour, this.endHour, this.reason,
      this.type, this.issueId);


factory
Absent.fromJson(Map<String, dynamic> json)=> _$AbsentFromJson(json);

Map<String, dynamic> toJson() => _$AbsentToJson(this);
}


// val status: String?,
// val statusId : Int,
// val employee: String?,
// val user: User?,
// val assign: User?,
// val absentType: String?,
// val special_leave: Int,
// val date: String?,
// val month: String?,
// val year: Int?,
// val startDate: String?,
// val endDate: String?,
// val startHour: String?,
// val endHour: String?,
// val reason: String?,
// val type: Int?,     // 4 5 7 8 - 4 loại nghỉ
// val issueId: Int?