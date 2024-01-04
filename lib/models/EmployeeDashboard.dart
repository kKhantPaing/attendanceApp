class EmployeeDashboard {
  EmployeeDashboard({
    this.employeeid,
    this.empname,
    this.emppos,
    this.normal,
    this.late,
    this.leave,
    this.absent,
    this.intime,
    this.outtime,
    this.status,
  });

  int? employeeid;
  String? empname;
  String? emppos;
  int? normal;
  int? late;
  int? leave;
  int? absent;
  String? intime;
  String? outtime;
  int? status;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json["employeeid"] = employeeid;
    json["empname"] = empname;
    json["emppos"] = emppos;
    json["normal"] = normal;
    json["late"] = late;
    json["leave"] = leave;
    json["absent"] = absent;
    json["intime"] = intime;
    json["outtime"] = outtime;
    json["status"] = status;
    return json;
  }

  EmployeeDashboard.fromJson(Map<String, dynamic> json) {
    employeeid = json["employeeid"];
    empname = json["empname"];
    emppos = json["emppos"];
    normal = json["normal"] ?? 0;
    late = json["late"] ?? 0;
    leave = json["leave"] ?? 0;
    absent = json["absent"] ?? 0;
    intime = json["intime"] ?? '';
    outtime = json["outtime"] ?? '';
    status = json["status"] ?? 0;
  }
}
