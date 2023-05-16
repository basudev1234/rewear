// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:rewear/Views/Screens/Home/New%20User/main_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Provider/profile_provider.dart';
import '../Provider/profile_provider.dart';
import '../Services/add_shared_preferences.dart';
import '../Services/get_shared_preferences.dart';

// testing token
// Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6dHJ1ZSwiaWF0IjoxNjYyOTU4MDM1LCJqdGkiOiI4MzZhMzgwYS0wM2Y3LTQ0MGYtYTg0MC02NTQ3Mzk3ZGYwNDciLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoiMDA5MTEwMDAwMDAwNTYiLCJuYmYiOjE2NjI5NTgwMzV9.5MtGAVcSH5NHeMJnhbTzw5D9gquDT9lR6gtr1Cl4vig
class Server {
  String baseUrl = 'https://app.evaluate-health.com/main';

  final Map socialData = {};
  Stream<Map> fetchSocial() => Stream.periodic(
        const Duration(
          minutes: 2,
        ),
      ).asyncMap(
        (_) => social(
          page: "1",
          sub_page: "1",
        ),
      );

  final Map profile = {};
  Stream<Map> profileStream() => Stream.periodic(
        const Duration(
          seconds: 120,
        ),
      ).asyncMap(
        (_) => fetchProfile(),
      );

  Future<Map> social({required String page, required String sub_page}) async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      final query = {"page": page, "sub_page": sub_page};
      String jsonString = json.encode(query);
      var url = Uri.parse(
          'https://app.evaluate-health.com/main/social/socialArticles');

      var response = await http.post(
        url,
        body: jsonString,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${m["token"]}',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${m["token"]}',
        },
      );
      // print(response.statusCode);
      if (response.statusCode == 200) {
        Map decode = jsonDecode(response.body);

        return decode;
      } else {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: "Something went wrong with social ${response.statusCode}",
          ),
        );
        return {};
      }
    } catch (e) {
      return {};
      print(e);
    }
  }

  Future addConsent({
    required String s1,
    required String s2,
    required String s3,
    required String s4,
    required List<String> organ,
  }) async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse('${baseUrl}/profile/editConsent');
      var body = jsonEncode({
        "emergency_protocol": s1,
        "location_tracking": s2,
        "hospitalization": s3,
        "organ_donation": s4,
        "organ_list": organ,
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

  Future addFamilyContact(
      {required String name,
      required String relation,
      required String phone}) async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse('${baseUrl}/profile/editFamilyContact');
      var body = jsonEncode({
        "contact_name": name,
        "relation": relation,
        "mobileno": phone,
        "active": "1",
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

  Future<Map> fetchProfile() async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse('${baseUrl}/profile/fetchProfile');

      http.Response response = await http.post(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${m["token"]}',
      });
      if (response.statusCode == 200) {
        Map decode = jsonDecode(response.body);
        return decode;
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: "Something went wrong",
          ),
        );
        return {};
      }
    } catch (e) {
      return {};
      print(e);
    }
  }

  // edit profile

  // edit exposure

  Future editExposure(
      {required String exposure,
      required String active,
      required BuildContext context}) async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse('$baseUrl/profile/editDailyExposure');
      final body = jsonEncode({
        "exposure": exposure,
        "active": active,
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
        Fluttertoast.showToast(
            msg: "Successful",
            textColor: Colors.white,
            backgroundColor: Colors.greenAccent);
        Provider.of<ProfileProvider>(context, listen: false)
            .updateProfileData();

        return decode;
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: "Cannot add exposure",
          ),
        );
      }
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }

  Future editVehicle({
    required BuildContext context,
    required String vehicleType,
    required String model,
    required String registration,
    required String color,
    required String note,
    required String active,
  }) async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse('${baseUrl}/profile/editVehicle');
      var body = jsonEncode({
        "vehicle_type": vehicleType,
        "vehicle_model": model,
        "registration_no": registration,
        "vehicle_color": color,
        "notes": note,
        // "vehicle_doc":
        //     "https://app.evaluate-health.com/static/UserData/00911000000003/PRESCRIPTION/prescription_2021-11-10-15-13_00911000000003.jpg",
        "active": active
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
        Fluttertoast.showToast(
            msg: "Successful",
            textColor: Colors.white,
            backgroundColor: Colors.greenAccent);
        Provider.of<ProfileProvider>(context, listen: false)
            .updateProfileData();
        Navigator.of(context).pop();

        return decode;
      } else {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: response.statusCode.toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future editPersonalInfo({
    required String info,
  }) async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse('${baseUrl}/profile/editPersonalIdentification');
      var body = jsonEncode({
        "identification_mark": [
          {
            'value': "fdkfjkjfk",
            'active': "2",
          }
        ]
      });
      print(body);
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6dHJ1ZSwiaWF0IjoxNjYyOTU4MDM1LCJqdGkiOiI4MzZhMzgwYS0wM2Y3LTQ0MGYtYTg0MC02NTQ3Mzk3ZGYwNDciLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoiMDA5MTEwMDAwMDAwNTYiLCJuYmYiOjE2NjI5NTgwMzV9.5MtGAVcSH5NHeMJnhbTzw5D9gquDT9lR6gtr1Cl4vig',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        Fluttertoast.showToast(
            msg: "Successful",
            textColor: Colors.white,
            backgroundColor: Colors.greenAccent);
        return decode;
      } else {
        Get.showSnackbar(
          GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: response.body.toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future editHealth({
    required String dob,
    required Map gender,
    required String height,
    required String weight,
    required Map blood_group,
  }) async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse(
        '${baseUrl}/profile/editBasicDetails',
      );
      var body = jsonEncode({
        "gender": {
          "gender_id": gender['gender_id'],
          "label": gender['label'],
        },
        "blood_group": {
          "blood_group_id": blood_group['blood_group_id'],
          "label": blood_group['label'],
        },
        "date_of_birth": dob,
        "weight": {
          "value": weight,
          "unit": "cm",
        },
        "height": {
          "value": height,
          "unit": "kg",
        },
      });
      print(body);
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
            message: response.body.toString(),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future accessDependent({
    required String token,
    required String uid,
  }) async {
    try {
      var url = Uri.parse('${baseUrl}/profile/accessDependent');
      final body = jsonEncode({
        "eh_user_id": uid,
      });
      http.Response response = await http.post(url, body: body, headers: {
        // 'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        return response;
        print(response);
      } else {
        print("something went wrong");
      }
    } catch (e) {
      print(e);
    }
  }

  // save welcome data

  Future saveWelcomeData({
    required Map data,
  }) async {
    try {
      var v = await getTokenFromSF();
      Map m = jsonDecode(v);
      var url = Uri.parse('${baseUrl}/profile/saveWelcomeData');
      var body = jsonEncode(data);
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${m["token"]}',
        },
        body: body,
      );
      print(response.statusCode);
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

  Future checkWelcomeData(
      {required String token, required BuildContext context}) async {
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
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (context) => MainPageView()));
      }
    } catch (e) {
      print(e);
    }
  }

  // signup code chunk

  Future signUp({
    required String mobile,
    required String countryCode,
    required String password,
    required String uid,
    required String token,
    required BuildContext context,
  }) async {
    try {
      var url = Uri.parse('$baseUrl/register/signupWithoutOTP');
      final body = jsonEncode({
        "mobile": mobile,
        "country_code": countryCode,
        "password": password,
        "verify_status": true,
        "verified_uid": uid,
        "device_id": DateTime.now().millisecondsSinceEpoch.toString(),
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
        Map value = json.decode(response.body);
        Map userData = {
          "token": value["access_token"][0],
          "user_id": value['user_id'],
          "user_token": value['user_token'],
          "phone": mobile,
        };
        addTokenToSF(
          token: json.encode(userData),
        );
        return jsonDecode;
      } else {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: " Error ${response.statusCode}",
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // login code chunk

  Future login({
    required String email,
    required String password,
    required String token,
    required String countryCode,
  }) async {
    try {
      var url = Uri.parse('$baseUrl/register/login');
      final body = jsonEncode({
        "emailormob": email,
        "password": password,
        "fcm_id": token,
        "device_id": DateTime.now().microsecondsSinceEpoch.toString(),
        "country_code": countryCode,
      });
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return body;
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

// verify if user exists in the DB

  Future verifyUser({
    required String emailOrMob,
    required BuildContext context,
    required String countryCode,
  }) async {
    try {
      var url = Uri.parse('$baseUrl/register/verifyUser');
      final body = jsonEncode({
        "emailormoborehid": emailOrMob,
        'country_code': countryCode,
      });
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        // Provider.of<AuthProvider>(context, listen: false).verifyUser(
        //   Ch: check.fromJson(
        //     json.decode(
        //       response.body,
        //     ),
        //   ),
        // );
        var res = json.decode(response.body);
        return res;
      } else if (response.statusCode == 400) {
        // ignore: use_build_context_synchronously
        // Provider.of<AuthProvider>(context, listen: false).verifyUser(
        //   Ch: check.fromJson(
        //     json.decode(
        //       response.body,
        //     ),
        //   ),
        // );
        var res = jsonDecode(response.body);
        return res;
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            duration: Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            message: "Please enter a valid phone number.",
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
// class fetchProfile {
//   static final Map profile = {},
//  Stream<double> fetch() => Stream.periodic(Duration(seconds: 2)).asyncMap((_) => fetchProfile());
// Future fetchProfile() async {
// try {
// var v = await getTokenFromSF();
// Map m = jsonDecode(v);
// var url = Uri.parse('${baseUrl}/profile/fetchProfile');
// http.Response response = await http.post(url, headers: {
// 'Content-Type': 'application/json',
// 'Authorization': 'Bearer ${m["token"]}', });
// if (response.statusCode == 200) {
// var decode = jsonDecode(response.body);
// return decode;
// } else {
// Get.showSnackbar(
// const GetSnackBar(
// duration: Duration(seconds: 4),
// backgroundColor: Colors.redAccent,
// message: "Something went wrong",
// ),
// );
// }
// } catch (e) {
// print(e);
// }
// }
// }