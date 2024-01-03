class CheckInOutEnqModel {
  int? employeeid;
  String? date;
  int? departmentid;
  int? teamid;
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
  int? attstatusid;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeid'] = this.employeeid;
    data['date'] = this.date;
    data['departmentid'] = this.departmentid;
    data['teamid'] = this.teamid;
    data['employeecode'] = this.employeecode;
    data['employeename'] = this.employeename;
    data['departmentname'] = this.departmentname;
    data['teamname'] = this.teamname;
    data['time1'] = this.time1;
    data['time2'] = this.time2;
    data['workhours'] = this.workhours;
    data['status'] = this.status;
    data['positionname'] = this.positionname;
    data['photo'] = this.photo;
    data['attstatusid'] = this.attstatusid;
    return data;
  }
}
