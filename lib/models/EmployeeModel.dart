class EmployeeModel {
  String? departmentid;
  String? departmentname;
  String? teamid;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departmentid'] = departmentid;
    data['departmentname'] = departmentname;
    data['teamid'] = teamid;
    data['teamname'] = teamname;
    data['code'] = code;
    data['name'] = name;
    data['positionname'] = positionname;
    data['phone'] = phone;
    data['branchid'] = branchid;
    return data;
  }
}
