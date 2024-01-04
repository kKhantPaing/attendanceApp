import 'dart:convert';
import 'dart:core';
import 'package:attendance_app/helper/GlobalInfo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String _empName = '', _empPos = '';
  late String _swipeBtnText = 'Swipe to Check In';
  bool _isFinished = false;
  int _status = 0;
  int _normalCount = 0;
  int _lateCount = 0;
  int _leaveCount = 0;
  int _absentCount = 0;
  String _cinTime = '--:--';
  String _coutTime = '--:--';

  DbHelper dbHelper = new DbHelper();
  GlobalInfo globalInfo = GlobalInfo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Attendance',
          style: TextStyle(
            color: Colors.white,
          ),),
          backgroundColor: Colors.blueAccent,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            checkInOutWidget(_cinTime, 0),
                            checkInOutWidget(_coutTime, 1),
                          ],
                        ),
                      ),
                      SwipeableButtonView(
                        activeColor: Colors.blueAccent,
                        buttonWidget: const Icon(
                          Icons.arrow_right_alt,
                          color: Colors.grey,
                        ),
                        buttonText: _swipeBtnText,
                        onFinish: () {
                          dbHelper.checkInOut(
                              time: DateTime.now.toString(),
                              empId: globalInfo.empId.toString(),
                              status: _status.toString());
                          _isFinished = true;
                        },
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

  void alreadyLogIn() async {
    final loginDataPref = await SharedPreferences.getInstance();
    int empID = loginDataPref.getInt('empId') ?? 0;
    if (empID > 0) {
      globalInfo.empId = empID.toString();
      globalInfo.branchId = 1.toString();
    }
  }

  void _loadData() async {
    alreadyLogIn();
    var value = await dbHelper.getEmployeeData(
        employeeid: globalInfo.empId.toString(),
        branchid: globalInfo.branchId.toString(),
        fdate: DateTime.now().toString());
    setState(() {
      var data = EmployeeDashboard.fromJson(jsonDecode(value));
      _empName = data.empname;
      _empPos = data.emppos;
      _normalCount = data.normal as int;
      _lateCount = data.late as int;
      _lateCount = data.leave as int;
      _absentCount = data.absent as int;
      _cinTime = data.intime;
      _coutTime = data.outtime;
      if (_status == 1) {
        _swipeBtnText = 'Swipe to Check Out';
      }
    });
  }
}

Widget checkInOutWidget(String time, int cio) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
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
