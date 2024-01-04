import 'package:attendance_app/Screen/LoginScreen.dart';
import 'package:attendance_app/Screen/AttendanceScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _route = '/';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _route = '/attendance';
    alreadyLogIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/attendance': (context) => const AttendanceScreen(),
      },
      initialRoute: _route,
    );
  }

  void alreadyLogIn() async {
    final loginDataPref = await SharedPreferences.getInstance();
    int empID = loginDataPref.getInt('empId') ?? 0;
    if (empID > 0) {
      _route = '/attendance';
    }
  }
}
