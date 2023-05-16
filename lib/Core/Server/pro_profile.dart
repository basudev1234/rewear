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

class Profile {
  String baseUrl = 'https://app.evaluate-health.com/main';

  // calendar fetch

  Future<Map> fetchProfessionalProfile() async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse(
        '${baseUrl}/Profession/fetchProfessionalDetails',
      );

      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${m["token"]}',
        },

        // eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6dHJ1ZSwiaWF0IjoxNjU0MzI1ODQ3LCJqdGkiOiJjZGRiYTFjNy1iMWI3LTQzYzgtOGMyNC04ZGNhZGNiODAyMmUiLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoiMDA5MTEwMDAwMDAwMDMiLCJuYmYiOjE2NTQzMjU4NDd9.C_H-7X7U9iYaQ5tDyd-DsewJG4JkgheqBDtTz6YQcE8
      );
      if (response.statusCode == 200) {
        Map decode = jsonDecode(response.body);
        return decode;
      } else if (response.statusCode == 500) {
        return {
          "flag": false,
        };
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

  Future checkWelcomeData({required String token}) async {
    try {
      var url = Uri.parse('${baseUrl}/profile/checkWelcomeData');
      http.Response response = await http.post(url, body: {}, headers: {
        // 'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        return decode;
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: "Something went wrong",
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future login({
    required String email,
    required String password,
    required String token,
  }) async {
    try {
      var url = Uri.parse('$baseUrl/register/login');
      final body = jsonEncode({
        "emailormob": email,
        "password": password,
        "fcm_id": token,
      });
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        {
          Get.showSnackbar(
            const GetSnackBar(
              duration: Duration(seconds: 4),
              backgroundColor: Colors.redAccent,
              message: "Incorrect password",
            ),
          );
        }
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: "Internal Server Error",
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future verifyUser(
      {required String emailOrMob, required BuildContext context}) async {
    try {
      var url = Uri.parse('$baseUrl/register/verifyUser');
      final body = jsonEncode({"emailormoborehid": emailOrMob});
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Provider.of<AuthProvider>(context, listen: false).verifyUser(
          Ch: check.fromJson(
            json.decode(
              response.body,
            ),
          ),
        );
      } else if (response.statusCode == 400) {
        // ignore: use_build_context_synchronously
        Provider.of<AuthProvider>(context, listen: false).verifyUser(
          Ch: check.fromJson(
            json.decode(
              response.body,
            ),
          ),
        );
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: "Please enter a valid phone,email or EH id",
          ),
        );
      }
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }

  Future signUp(
      {required String emailOrMob, required BuildContext context}) async {
    try {
      var url = Uri.parse('$baseUrl/register/verifyUser');
      final body = jsonEncode({"emailormoborehid": emailOrMob});
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Provider.of<AuthProvider>(context, listen: false).verifyUser(
          Ch: check.fromJson(
            json.decode(
              response.body,
            ),
          ),
        );
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: "Please enter a valid phone,email or EH id",
          ),
        );
      }
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }

// table_name
  // allergy and stuff
  Future fetchAllergy() async {
    try {
      final queryParameters = {
        'table_name': 'allergy',
      };
      final uri = Uri.https('app.evaluate-health.com',
          '/main/generaldata/fetchData', queryParameters);
      final response = await http.get(uri, headers: {
        HttpHeaders.acceptHeader: 'application/json',
      });

      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        return decode;
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: "Something went wrong with allergy",
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  // add Allergy

  Future addAllergy({required String allergen, required int indes}) async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse('$baseUrl/profile/addAllergy');
      final body = jsonEncode({
        'allergen_value': {
          'allergen': allergen,
          'value': indes,
        },
      });
      http.Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${m["token"]}',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        print(decode);
        return decode;
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: "Cannot add allergy",
          ),
        );
      }
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }
}

//
