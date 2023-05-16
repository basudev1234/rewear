import 'dart:async';
import 'dart:convert';

import 'package:rewear/Core/Provider/auth_provider.dart';
import 'package:rewear/Core/Server/request.dart';
import 'package:rewear/Core/Services/add_shared_preferences.dart';
import 'package:rewear/Views/Screens/Authentication/gate_screen.dart';
import 'package:rewear/Views/Screens/Authentication/otp_screen.dart';
import 'package:rewear/Views/Screens/Authentication/signup.dart';
import 'package:lottie/lottie.dart';
import 'package:rewear/Views/Screens/Home/Main%20Screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _country = '+91';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          MaterialButton(
            onPressed: () async {
              await FirebaseAuth.instance.signInAnonymously().whenComplete(
                    () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    ),
                  );
            },
            color: Colors.black,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(30))),
            child: const Text(
              "SKIP",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          reverse: true,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.asset(
                  'Assets/Lottie/auth.json',
                ),
                const Text(
                  "Please enter your phone number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Color.fromRGBO(138, 154, 91, 1),
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "We will need to verify it's really you.",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                IntlPhoneField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  onCountryChanged: (v) {
                    setState(() {
                      _country = '+${v.dialCode}';
                      print(_country);
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: "10 digit mobile number",
                  ),
                  initialCountryCode: 'IN',
                  controller: _controller,
                  validator: (text) {
                    if (text!.completeNumber.isEmpty) {
                      return "Field can't be empty";
                    } else if (text.completeNumber.length < 10) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                RoundedLoadingButton(
                  successColor: Colors.green,
                  width: Get.width * 0.9,
                  // color: Color.fromRGBO(138, 154, 91, 1),
                  color: Colors.black,
                  controller: _btnController,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Timer(
                        const Duration(seconds: 2),
                        () {
                          _btnController.success();
                          Navigator.of(context).pushReplacement(
                              CupertinoPageRoute(
                                  builder: (context) => VerifyPhoneNumberScreen(
                                      country: _country,
                                      phoneNumber: _controller.text)));
                        },
                      );
                    } else {
                      _formKey.currentState!.validate();
                      // _btnController.error();
                      _btnController.reset();
                      // print(_controller.text);
                    }
                  },
                  child: const Text('Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ),
                const SizedBox(
                  height: 80,
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
