// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:rewear/Core/Model/user.dart';
import 'package:rewear/Core/Provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Services/get_shared_preferences.dart';

class CalendarReq {
  String baseUrl = 'https://app.evaluate-health.com/main';

  // calendar fetch

  Future<Map> fetchCalendar() async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse('${baseUrl}/calender/fetchScheduledEvents');

      String jsonString = jsonEncode({
        "period": "current",
      });
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${m["token"]}',
        },

        // eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6dHJ1ZSwiaWF0IjoxNjU0MzI1ODQ3LCJqdGkiOiJjZGRiYTFjNy1iMWI3LTQzYzgtOGMyNC04ZGNhZGNiODAyMmUiLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoiMDA5MTEwMDAwMDAwMDMiLCJuYmYiOjE2NTQzMjU4NDd9.C_H-7X7U9iYaQ5tDyd-DsewJG4JkgheqBDtTz6YQcE8
        body: jsonString,
      );
      if (response.statusCode == 200) {
        Map decode = jsonDecode(response.body);
        Map data = {
          "data": decode,
          "status": response.statusCode,
        };

        return data;
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: "Something went wrong",
          ),
        );
        // print(response.statusCode);
        return {
          "flag": false,
          "status": response.statusCode,
        };
      }
    } catch (e) {
      return {};
    }
  }

  Future addEvent({
    required String name,
    required String hash_tag,
    required String startDate,
    required String endDate,
    required List<String> organ,
  }) async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse('${baseUrl}/calender/editEvent');
      var body = jsonEncode({
        "event_name": "",
      });
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${m["token"]}',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        return decode;
      } else {
        Get.showSnackbar(
          GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: response.statusCode.toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future getSchedulerCategory() async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse('${baseUrl}/calender/fetchSchedulerCategory');

      http.Response response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${m["token"]}',
        },
      );
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        return decode;
      } else {
        Get.showSnackbar(
          GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: response.statusCode.toString(),
          ),
        );
      }
    } catch (e) {}
  }
}

//
