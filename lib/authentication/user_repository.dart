import 'dart:async';
import 'package:meta/meta.dart';
import 'package:poem_mobile/authentication/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  
  final SharedPreferences sharedPrefs;
  
  UserRepository(this.sharedPrefs);
  
  Future<Profile> login({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return Profile(userID: 1, fullName: 'John Doe', phoneNumber: '1342313123', token: 'adsfasdfasdfasfasdf', userName: 'Alex');
  }
  
  Future<bool> register() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
  
  Future<bool> verify(String otpCode) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return  true;
    } catch (e) {
      return false;
    }
  }
  
  bool isLogedIn() {
    return sharedPrefs.getBool('logged_in') ?? false;
  }
   
  Profile loadSession() {
   
    int userID = sharedPrefs.getInt('user_id');
    String fullName = sharedPrefs.getString('full_name');
    String userName = sharedPrefs.getString('user_name');
    String phoneNo = sharedPrefs.getString('phone_number');
    String token = sharedPrefs.getString('token');
    
    Profile profile = Profile(fullName: fullName, phoneNumber: phoneNo, token: token, userID: userID, userName: userName);
    return profile;
  }
  
  void deleteSession() {
    sharedPrefs.setBool('logged_in', false);
    sharedPrefs.setInt('user_id', -1);
    sharedPrefs.setString('full_name', null);
    sharedPrefs.setString('user_name', null);
    sharedPrefs.setString('phone_number', null);
    sharedPrefs.setString('token', null);
  }
   
  void saveSession(Profile profile) {
    sharedPrefs.setBool('logged_in', true);
    sharedPrefs.setInt('user_id', profile.userID);
    sharedPrefs.setString('full_name', profile.fullName);
    sharedPrefs.setString('user_name', profile.userName);
    sharedPrefs.setString('phone_number', profile.phoneNumber);
    sharedPrefs.setString('token', profile.token);
  }

}