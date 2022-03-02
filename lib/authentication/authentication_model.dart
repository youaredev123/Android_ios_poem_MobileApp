import 'package:meta/meta.dart';

class Profile {

  int userID;
  String userName;
  String fullName;
  String phoneNumber;
  String token;

  Profile({@required this.userID, @required this.token, @required this.userName, @required this.fullName, @required this.phoneNumber});
}