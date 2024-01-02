
/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class UserModel {
  String? userID;
  String? userName;
  String? userEmail;

  UserModel({this.userID, this.userName, this.userEmail});

  UserModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    userEmail = json['userEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userID'] = userID;
    data['userName'] = userName;
    data['userEmail'] = userEmail;
    return data;
  }
}

