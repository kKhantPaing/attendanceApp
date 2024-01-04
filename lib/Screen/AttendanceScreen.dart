import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:attendance_app/helper/GlobalInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:attendance_app/widget/SummaryContainer.dart';
import 'package:attendance_app/helper/DbHelper.dart';
import 'package:attendance_app/models/EmployeeDashboard.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String _empName = 'KK', _empPos = 'Programmer';
  late String _timeString;
  late String _swipeBtnText = 'Swipe to Check In';
  bool _isFinished = false;
  int _normalCount = 0;
  int _lateCount = 0;
  int _leaveCount = 0;
  int _absentCount = 0;
  DbHelper dbHelper = new DbHelper();
  GlobalInfo globalInfo = GlobalInfo();
  late Future<EmployeeDashboard> employeeDashboard;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    // Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    _loadData();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Attendance'),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black54),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Column(children: <Widget>[
                                const Text(
                                  'Welcome,',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _empName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  _empPos,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Colors.amberAccent,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  color: Colors.white60,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        SummaryContainer(
                                          label: 'Normal',
                                          count: _normalCount.toString(),
                                          color: Colors.greenAccent,
                                        ),
                                        SummaryContainer(
                                          label: 'Late In',
                                          count: _lateCount.toString(),
                                          color: Colors.yellowAccent,
                                        ),
                                        SummaryContainer(
                                          label: 'Leave',
                                          count: _leaveCount.toString(),
                                          color: Colors.orangeAccent,
                                        ),
                                        SummaryContainer(
                                          label: 'Absent',
                                          count: _absentCount.toString(),
                                          color: Colors.redAccent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white60,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              checkInOutWidget('10:00AM', 0),
                              checkInOutWidget('--:--', 1),
                            ],
                          ),
                        ),
                      ),
                      SwipeableButtonView(
                        activeColor: Colors.blueAccent,
                        buttonWidget: const Icon(
                          Icons.arrow_right_alt,
                          color: Colors.grey,
                        ),
                        buttonText: _swipeBtnText,
                        onFinish: () {},
                        isFinished: _isFinished,
                        onWaitingProcess: () {},
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getTime() {
    final DateTime timeNow = DateTime.now();
    final String formattedDateTime = _formatDateTime(timeNow);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  void _loadData() {
    employeeDashboard = dbHelper.getEmployeeData(
        employeeid: 8, branchid: "1", fdate: DateTime.now().toString());

    // setState(() {
    //   var tmp = employeeDashboard;
    //   _empName = tmp["empname"];
    //   _empPos = tmp["emppos"];
    //   _normalCount = tmp["normal"];
    //   _lateCount = tmp["late"];
    //   _leaveCount = tmp["leave"];
    //   _absentCount = tmp["absent"];
    //   _swipeBtnText = 'Swipe to Check In';
    // });
    }
}

Widget checkInOutWidget(String time, int cio) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        cio == 0
            ? const Icon(
                Icons.history,
                color: Colors.lightGreen,
              )
            : const Icon(
                Icons.update,
                color: Colors.orangeAccent,
              ),
        const SizedBox(
          height: 5,
        ),
        Text(
          time,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          cio == 0 ? 'Check In' : 'Check Out',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}
