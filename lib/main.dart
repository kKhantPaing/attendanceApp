import 'package:attendance_app/Screen/LoginScreen.dart';
import 'package:attendance_app/Screen/AttendanceScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/attendance': (context) => const AttendanceScreen(),
      },
      initialRoute: '/login',
    );
  }
}
