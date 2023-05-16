import 'package:shared_preferences/shared_preferences.dart';

getTokenFromSF() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  // return token
  String? token = preferences.getString('token');
  return token;
}
