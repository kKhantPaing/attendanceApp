class EmployeeDashboard {
  EmployeeDashboard({
    required this.employeeid,
    required this.empname,
    required this.emppos,
    required this.normal,
    required this.late,
    required this.leave,
    required this.absent,
    required this.intime,
    required this.outtime,
    required this.status,
  });

  String employeeid = '';
  String empname = '';
  String emppos = '';
  String normal = '';
  String late = '';
  String leave = '';
  String absent = '';
  String intime = '';
  String outtime = '';
  String status = '';

  factory EmployeeDashboard.fromJson(Map<String, dynamic> json) {
    return EmployeeDashboard(
      employeeid: json["employeeid"].toString(),
      empname: json["empname"].toString(),
      emppos: json["emppos"].toString(),
      normal: json["normal"].toString(),
      late: json["late"].toString(),
      leave: json["leave"].toString(),
      absent: json["absent"].toString(),
      intime: json["intime"].toString(),
      outtime: json["outtime"].toString(),
      status: json["status"].toString(),
    );
  }

  get getEmpId => employeeid;
  get getEmpName => empname;
  get getEmppos => emppos;
  get getNormal => normal;
  get getLate => late;
  get getLeave => leave;
  get getAbsent => absent;
  get getIntime => intime;
  get getOuttime => outtime;
  get getStatus => status;
}
