import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_demo/models/utils/GetLeaveDetailResponse.dart';

import '../../models/utils/ApiService.dart';

class DetailLeave extends StatefulWidget {
  const DetailLeave({super.key, required this.id});

  final int id;

  @override
  State<DetailLeave> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<DetailLeave> {
  late Future<GetLeaveDetailResponse> leaveDetail;

  // void callLogin() {
  //   setState(() {
  //     final DioClient dio = DioClient();
  //     dio.login();
  //   });
  // }
  //
  // void callGetDetail() {
  //   setState(() {
  //     final DioClient dio = DioClient();
  //     leaveDetail = dio.getDetailLeave();
  //   });
  // }

  void callGetDetail() {
    setState(() {
      final ApiService dio = ApiService();
      leaveDetail = dio.getDetailLeave(widget.id);
    });
  }

  @override
  void initState() {
    super.initState();
    callGetDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(widget.id.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Absent',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Start date',
                  ),
                  FutureBuilder<GetLeaveDetailResponse>(
                    future: leaveDetail,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        GetLeaveDetailResponse leave = snapshot.data!;
                        return Text('${leave.data.start_date}');
                      } else if (snapshot.hasError) {
                        final error = snapshot.error;
                        return Text('$error');
                      } else {
                        return const Text('Waiting');
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'End date',
                  ),
                  FutureBuilder<GetLeaveDetailResponse>(
                    future: leaveDetail,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        GetLeaveDetailResponse leave = snapshot.data!;
                        return Text('${leave.data.due_date}');
                      } else if (snapshot.hasError) {
                        final error = snapshot.error;
                        return Text('$error');
                      } else {
                        return const Text('Waiting');
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  <Widget>[
                  const Text(
                    'Employee',
                  ),
                  FutureBuilder<GetLeaveDetailResponse>(
                    future: leaveDetail,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        GetLeaveDetailResponse leave = snapshot.data!;
                        return Text('${leave.data.user!.firstname} ${leave.data.user!.lastname}');
                      } else if (snapshot.hasError) {
                        final error = snapshot.error;
                        return Text('$error');
                      } else {
                        return const Text('Waiting');
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Reason',
                  ),
                  FutureBuilder<GetLeaveDetailResponse>(
                    future: leaveDetail,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        GetLeaveDetailResponse leave = snapshot.data!;
                        return Text('${leave.data.description}');
                      } else if (snapshot.hasError) {
                        final error = snapshot.error;
                        return Text('$error');
                      } else {
                        return const Text('Waiting');
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'Status',
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FutureBuilder<GetLeaveDetailResponse>(
                        future: leaveDetail,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            GetLeaveDetailResponse leave = snapshot.data!;
                            return Text(getStatusDesc(leave.data.status_id));
                          } else if (snapshot.hasError) {
                            final error = snapshot.error;
                            return Text('$error');
                          } else {
                            return const Text('Waiting');
                          }
                        },
                      ),
                      Image.asset("assets/icons/ic_drop_down.png",height: 20, width: 20,)
                    ])),
            Container(
              margin: const EdgeInsets.only(top: 12.0),
              width: double.infinity,
              child: TextButton(
                onPressed: () => {
                  callGetDetail(),
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(15)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                ),
                child: const Text("Ok"),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getStatusDesc(int statusId) {
    var result = "";
    switch (statusId) {
      case 1:
        result = "New";
        break;
      case 7:
        result = "Reject";
        break;
      case 8:
        result = "Approve";
        break;
      case 9:
        result = "Confirm";
        break;
      case 10:
        result = "Cancel";
        break;
    }
    return result;
  }
}
