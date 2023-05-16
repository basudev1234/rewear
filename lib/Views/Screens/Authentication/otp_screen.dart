import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rewear/Views/Screens/Authentication/gate_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:rewear/Views/Screens/Home/New%20User/main_page_view.dart';

import '../../../Core/Server/request.dart';
import '../../../Core/Services/add_shared_preferences.dart';
import '../../Widgets/pin_input_field.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  static const id = 'VerifyPhoneNumberScreen';

  final String phoneNumber;
  final String country;

  const VerifyPhoneNumberScreen({
    Key? key,
    required this.country,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomViewInsets = WidgetsBinding.instance.window.viewInsets.bottom;
    isKeyboardVisible = bottomViewInsets > 0;
  }

  // scroll to bottom of screen, when pin input field is in focus.
  Future<void> _scrollToBottomOnKeyboardOpen() async {
    while (!isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await Future.delayed(const Duration(milliseconds: 250));

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FirebasePhoneAuthHandler(
        phoneNumber: widget.country + widget.phoneNumber,
        signOutOnSuccessfulVerification: false,
        linkWithExistingUser: false,
        autoRetrievalTimeOutDuration: const Duration(seconds: 60),
        otpExpirationDuration: const Duration(seconds: 60),
        onCodeSent: () {
          Fluttertoast.showToast(msg: "OTP sent");
        },
        onLoginSuccess: (userCredential, autoVerified) async {
          Get.showSnackbar(
            const GetSnackBar(
              duration: Duration(seconds: 4),
              backgroundColor: Colors.green,
              message: "Login Success",
            ),
          );
          await FirebaseFirestore.instance
              .collection('user')
              .doc(userCredential.user?.uid)
              .set({
            "phone number": widget.phoneNumber,
            "created on": FieldValue.serverTimestamp(),
          }).then(
            (value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MainPageView(),
              ),
            ),
          );
        },
        // ignore: void_checks
        onLoginFailed: (authException, stackTrace) {
          Get.showSnackbar(
            GetSnackBar(
              duration: const Duration(seconds: 4),
              backgroundColor: Colors.redAccent,
              message: "LoginFailed ${authException.message}",
            ),
          );

          switch (authException.code) {
            case 'invalid-phone-number':
              // invalid phone number
              return Get.showSnackbar(
                const GetSnackBar(
                  duration: Duration(seconds: 4),
                  backgroundColor: Colors.redAccent,
                  message: "Invalid phone number",
                ),
              );
            case 'invalid-verification-code':
              // invalid otp entered
              return Get.showSnackbar(
                const GetSnackBar(
                  duration: Duration(seconds: 4),
                  backgroundColor: Colors.redAccent,
                  message: "Invalid OTP",
                ),
              );
            // handle other error codes
            default:
              Get.showSnackbar(
                const GetSnackBar(
                  duration: Duration(seconds: 4),
                  backgroundColor: Colors.redAccent,
                  message: "Somethign went wrong",
                ),
              );
            // handle error further if needed
          }
        },
        onError: (error, stackTrace) {
          Get.showSnackbar(
            const GetSnackBar(
              duration: Duration(seconds: 4),
              backgroundColor: Colors.redAccent,
              message: "An error occured",
            ),
          );
        },
        builder: (context, controller) {
          return Scaffold(
            // appBar: AppBar(
            //   leadingWidth: 0,
            //   leading: const SizedBox.shrink(),
            //   title: const Text('Verify Phone Number'),
            //   actions: [
            //     if (controller.codeSent)
            //       TextButton(
            //         onPressed: controller.isOtpExpired
            //             ? () async {
            //                 await controller.sendOTP();
            //               }
            //             : null,
            //         child: Text(
            //           controller.isOtpExpired
            //               ? 'Resend'
            //               : '${controller.otpExpirationTimeLeft.inSeconds}s',
            //           style: const TextStyle(color: Colors.blue, fontSize: 18),
            //         ),
            //       ),
            //     const SizedBox(width: 5),
            //   ],
            // ),
            body: controller.isSendingCode
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CupertinoActivityIndicator(),
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          'Sending OTP',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  )
                : ListView(
                    padding: const EdgeInsets.all(20),
                    controller: scrollController,
                    children: [
                      Text(
                        "We've sent an SMS with a verification code to ${widget.phoneNumber}",
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      if (controller.isListeningForOtpAutoRetrieve)
                        Column(
                          children: const [
                            CupertinoActivityIndicator(),
                            SizedBox(height: 50),
                            Text(
                              'Listening for OTP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 15),
                            Divider(),
                            Text('OR', textAlign: TextAlign.center),
                            Divider(),
                          ],
                        ),
                      const SizedBox(height: 15),
                      const Text(
                        'Enter OTP',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      PinInputField(
                        length: 6,
                        onFocusChange: (hasFocus) async {
                          if (hasFocus) await _scrollToBottomOnKeyboardOpen();
                        },
                        onSubmit: (enteredOtp) async {
                          final verified =
                              await controller.verifyOtp(enteredOtp);
                          if (verified) {
                            // number verify success
                            // will call onLoginSuccess handler
                          } else {
                            // phone verification failed
                            // will call onLoginFailed or onError callbacks with the error
                          }
                        },
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
