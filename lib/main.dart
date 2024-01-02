import 'package:attendance_app/Screen/LoginScreen.dart';
import 'package:attendance_app/Screen/AttendanceScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login' : (context) => LoginScreen(),
        '/attendance' : (context) => AttendanceScreen(),
       },
      initialRoute: '/login',
    );
  }
}
