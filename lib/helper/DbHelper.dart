import 'package:http/http.dart';

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

  Future<String> getEmployeeData(
      {required String employeeid,
      required String fdate,
      required String branchid}) async {
    Uri url = Uri.http(api, '/api/mobile/EmployeeLogin',
        {'employeeid': employeeid, 'fdate': fdate, 'branchid': branchid});
    final result = await get(url);
    return result.body;
  }

  Future<String> checkInOut(
      {String time = '', String empId = '0', String status = '0'}) async {
    Uri url = Uri.http(api, '/api/mobile/EmployeeLogin',
        {'time': time, 'empId': empId, 'status': status});
    Response result = await post(url);
    if (result.statusCode == 200) {
      return "1";
    } else {
      return "-1";
    }
  }
}
