import 'package:http/http.dart';
import 'package:intl/intl.dart';

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

  Future<void> checkInOut({String employeeid = '0', String status = '0'}) async {
    Uri url = Uri.http(api, '/api/mobile/SetEmployeeRecord',
        {'employeeid': employeeid, 'status': status, 'fdate': DateFormat('yyyy-MM-dd').format(DateTime.now())});
    await post(url);
  }
}
