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
}
