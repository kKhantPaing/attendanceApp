import 'dart:convert';

import 'package:http/http.dart';
import 'package:attendance_app/models/EmployeeDashboard.dart';

class DbHelper {
  final String api = '192.168.100.13:808';

  Future<String> userLogin({String email = '', String password = ''}) async {
    Uri url = Uri.http(api, '/api/mobile/EmployeeLogin', {'email': email});
    Response result = await get(url);
    if (result.statusCode == 200) {
      return result.body;
    } else {
      return "-1";
    }
  }

  Future<EmployeeDashboard> getEmployeeData(
      {int? employeeid = 0, String? fdate = '', String? branchid = ''}) async {
    Uri url = Uri.http(api, '/api/mobile/EmployeeLogin',
        {'employeeid': employeeid, 'fdate': fdate, 'branchid': branchid});
    Response result = await get(url);

    if (result.statusCode == 200) {
      return EmployeeDashboard.fromJson(
          jsonDecode(jsonDecode(result.body)[0]) as Map<String, dynamic>);
    } else {
      return throw Exception('Failed to load');
    }
  }
}
