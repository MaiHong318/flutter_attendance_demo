import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter_attendance_demo/models/utils/GetLeaveDetailResponse.dart';
import 'package:flutter_attendance_demo/models/utils/LoginResponse.dart';
import 'package:flutter_attendance_demo/models/utils/UserFullInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainLeaveListResponse.dart';

class ApiService {
  final Dio dio = Dio();
  static const API_BASE_URL = "https://attendance-api.grooo.com.vn";
  static const leaveDetail = "${API_BASE_URL}/leave/";
  static const leaveList =
      "${API_BASE_URL}/leave-get-list?paging=1&limit=10&page=1&type=&status=&assigned_id=&user_id=&start=&end=";
  static const _login =
      "${API_BASE_URL}/auth/login?username=tiendv&password=duongtien&auth_type=app";
  String globalToken = "";

  ApiService() {
    initDio();
  }

  void initDio() {
    dio.interceptors
        .add(DioLoggingInterceptor(level: Level.body, compact: false));
  }


  Future<LoginResponse> login() async {
    var response = await dio.post(_login);
      //   print(response);
    var data = response.data;
    LoginResponse loginResponse = LoginResponse(data['success'], data['token']);
    getToken(data['token']);

    return loginResponse;
  }

  void getToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("token",jsonEncode(token));
  }

  Future<GetLeaveDetailResponse> getDetailLeave(int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    globalToken = jsonDecode( pref.getString("token")!);

    dio.options.headers["Authorization"] = "Bearer $globalToken";

      var response = await dio.get(leaveDetail + id.toString());
      // print(response);
      // print(response.data);
    GetLeaveDetailResponse getLeaveDetailResponse = GetLeaveDetailResponse.fromJson(response.data);
    UserFullInfo userFullInfo = getLeaveDetailResponse.data;
    //print(getLeaveDetailResponse.data.toJson());
    return getLeaveDetailResponse;
  }

  Future<MainLeaveListResponse> getLeaveList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    globalToken = jsonDecode( pref.getString("token")!);

    dio.options.headers["Authorization"] = "Bearer $globalToken";

      var response = await dio.get(leaveList);
     // print(response);
      //print(response.data);
    MainLeaveListResponse mainLeaveListResponse = MainLeaveListResponse.fromJson(response.data);
    List<UserFullInfo> list  = <UserFullInfo>[]; //  response.data.data;
    list.addAll(mainLeaveListResponse.data.data);
   // print(jsonEncode(list));
     // print(mainLeaveListResponse.data.data.toJson());
    //  print(jsonEncode(mainLeaveListResponse.data.data));

    return mainLeaveListResponse;
  }


}
