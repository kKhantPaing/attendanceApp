class GlobalInfo {
  String? url;
  String? empId;
  String? branchId;

  GlobalInfo({this.url, this.empId, this.branchId});

  bool getEmployeeData(int employeeId) {
    if (employeeId > 0) {
      return true;
    } else {
      return false;
    }
  }

  get getUrl => url;
  get getEmpId => empId;
  get getBranchId => branchId;

}
