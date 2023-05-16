import 'dart:convert';

import 'package:rewear/Core/Model/main_model.dart';
import 'package:rewear/Core/Model/user.dart';
import 'package:rewear/Core/Server/request.dart';
import 'package:rewear/Core/Services/get_shared_preferences.dart';
import 'package:rewear/Views/Screens/Home/Main%20Screens/main_screen.dart';
import 'package:rewear/Views/Screens/Home/New%20User/main_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

import 'auth.dart';

class GateScreen extends StatelessWidget {
  const GateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return MainScreen();
    } else {
      return AuthScreen();
    }

    // if (string) {
    //   String json = evaluateH.sharedPreferences.getString('token') as String;
    //   var decodedJson = jsonDecode(json);
    //   var res = Server().checkWelcomeData(token: decodedJson["token"]);
    //   print(res);
    //   return MainScreen();
    // } else {
    //   return AuthScreen();
    // }
  }
}

// Future getToken () async{
//   String token = Candidate
// }
