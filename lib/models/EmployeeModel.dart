class EmployeeModel {
  int? departmentid;
  String? departmentname;
  int? teamid;
  String? teamname;
  String? code;
  String? name;
  String? positionname;
  String? phone;
  String? branchid;

  EmployeeModel({
    this.departmentid,
    this.departmentname,
    this.teamid,
    this.teamname,
    this.code,
    this.name,
    this.positionname,
    this.phone,
    this.branchid,
  });

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    departmentid = json['departmentid'];
    departmentname = json['departmentname'];
    teamid = json['teamid'];
    teamname = json['teamname'];
    code = json['code'];
    name = json['name'];
    positionname = json['positionname'];
    phone = json['phone'];
    branchid = json['branchid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentid'] = this.departmentid;
    data['departmentname'] = this.departmentname;
    data['teamid'] = this.teamid;
    data['teamname'] = this.teamname;
    data['code'] = this.code;
    data['name'] = this.name;
    data['positionname'] = this.positionname;
    data['phone'] = this.phone;
    data['branchid'] = this.branchid;
    return data;
  }
}
