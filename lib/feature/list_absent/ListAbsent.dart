import 'package:flutter/material.dart';
import 'package:flutter_attendance_demo/feature/detail_leave/DetailLeave.dart';
import 'package:flutter_attendance_demo/models/utils/Absent.dart';
import 'package:flutter_attendance_demo/models/utils/ApiService.dart';
import 'package:flutter_attendance_demo/models/utils/MainLeaveListResponse.dart';
import 'package:flutter_attendance_demo/models/utils/UserFullInfo.dart';
import 'package:intl/intl.dart';

class ListAbsent extends StatefulWidget {
  ListAbsent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListAbsentState();
}

Widget itemList(
    String dow, String day, String name, String leave, String status) {
  return Container(
    margin: const EdgeInsets.only(top: 5),
    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
    decoration: const BoxDecoration(color: Colors.white70
        //  border: Border.all(width: 1)

        ),
    child: ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dow, style: TextStyle(fontSize: 16)),
          Text(day, style: TextStyle(fontSize: 16)),
        ],
      ),
      title: Text(name, style: TextStyle(fontSize: 16)),
      subtitle: Text(leave, style: TextStyle(fontSize: 16)),
      trailing: Text(status, style: TextStyle(fontSize: 16)),
    ),
  );
}

class _ListAbsentState extends State<ListAbsent> {
  late Future<MainLeaveListResponse> dataFuture;
  ApiService apiService = ApiService();
  List<Absent> absent = <Absent>[];
  List<UserFullInfo> list = <UserFullInfo>[];

  @override
  void initState() {
    super.initState();
    
    apiService.login();

    dataFuture = apiService.getLeaveList() ;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
        title: Text("My absent list"),
      ),
      body: Column(
        children: [
          FutureBuilder<MainLeaveListResponse>(
            future: dataFuture,
            builder: (context, snapshort) {
              if(snapshort.hasData) {
                Text("Has Data");
                  list = snapshort.data!.data.data;
                  absent = convertUserFullInfoToAbsent(list);
                return Expanded(child:
                ListView.builder(
                  itemCount: absent.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                DetailLeave(id: absent[index].issueId)),
                          );
                        },
                        child:
                        itemList(absent[index].date, absent[index].startDate,
                            absent[index].employee, absent[index].endDate,
                            absent[index].status) // itemList("Monday", "1/2/2023", "Nguyễn Mai Hồng", "1 day", "Confirmed")),

                    );

                  },
                    ),
                );
              } else if(snapshort.hasError) {
                return Text("Error!!!");
              }
              return const Text("Waitingggggggggg");
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Absent> convertUserFullInfoToAbsent(List<UserFullInfo> list) {
    List<Absent> result = <Absent>[];
    for (var item in list) {
     //  String date = (DateFormat('EEEE')..format(DateFormat("DD MMMM yyyy").parse(item.start_date))) as String;
      // String month = getMonthFromRawData(item.start_date);
      // int year = getYearFromRawData(item.start_date);
      //  String absentType = getTypeDesc(item.tracker_id);
      String? reason = item.description;
      String status = getStatusDescPast(item.status_id);
      int statusId = item.status_id;
      String startDate = item.start_date!;
      String endDate = item.due_date!;
      String startHour = item.start_time;
      String endHour = item.due_time;
      String employee = item.user!.lastname + " " + item.user!.firstname;
      String user = item.user.toString();
      String assign = item.assign.toString();
      int type = item.tracker_id;
      int issueId = item.id;

      Absent absent = Absent(status, statusId, employee, user, assign, "absentType", "date", "month", 2023, startDate, endDate, startHour, endHour, reason, type, issueId);

      result.add(absent);

    }
    return result;
  }


    String getStatusDescPast (int statusId) {
      String status= "";
     switch (statusId) {
       case 1:
         status = "New";
         break;
       case 7:
         status = "Rejected";
         break;
       case 8:
         status = "Approved";
         break;
       case 9:
         status = "Confirmed";
         break;
       case 10:
         status = "Cancelled";
         break;
     }

    return status;
    }
}


