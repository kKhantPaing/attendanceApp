class CheckInOutEnqModel {
  String? employeeid;
  String? date;
  String? departmentid;
  String? teamid;
  String? employeecode;
  String? employeename;
  String? departmentname;
  String? teamname;
  String? time1;
  String? time2;
  String? workhours;
  String? status;
  String? positionname;
  String? photo;
  String? attstatusid;

  CheckInOutEnqModel(
      {this.employeeid,
      this.date,
      this.departmentid,
      this.teamid,
      this.employeecode,
      this.employeename,
      this.departmentname,
      this.teamname,
      this.time1,
      this.time2,
      this.workhours,
      this.status,
      this.positionname,
      this.photo,
      this.attstatusid});

  CheckInOutEnqModel.fromJson(Map<String, dynamic> json) {
    employeeid = json['employeeid'];
    date = json['date'];
    departmentid = json['departmentid'];
    teamid = json['teamid'];
    employeecode = json['employeecode'];
    employeename = json['employeename'];
    departmentname = json['departmentname'];
    teamname = json['teamname'];
    time1 = json['time1'];
    time2 = json['time2'];
    workhours = json['workhours'];
    status = json['status'];
    positionname = json['positionname'];
    photo = json['photo'];
    attstatusid = json['attstatusid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employeeid'] = employeeid;
    data['date'] = date;
    data['departmentid'] = departmentid;
    data['teamid'] = teamid;
    data['employeecode'] = employeecode;
    data['employeename'] = employeename;
    data['departmentname'] = departmentname;
    data['teamname'] = teamname;
    data['time1'] = time1;
    data['time2'] = time2;
    data['workhours'] = workhours;
    data['status'] = status;
    data['positionname'] = positionname;
    data['photo'] = photo;
    data['attstatusid'] = attstatusid;
    return data;
  }
}
