import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rewear/Core/Server/request.dart';
import 'package:rewear/Core/Services/location_service.dart';
import 'package:rewear/Views/Screens/Home/Main%20Screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../Core/Provider/main_page_view_provider.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  PageController controller = PageController(initialPage: 0);
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  final List _gender = [
    {
      "name": "Male",
      "icon": FontAwesomeIcons.mars,
    },
    {
      "name": "Female",
      "icon": FontAwesomeIcons.venus,
    },
    {
      "name": "Others",
      "icon": FontAwesomeIcons.mercury,
    },
  ];

  final List _profession = [
    {
      "name": "Doctor",
      "images": 'Assets/Icon/doctor.png',
    },
    {
      "name": "Pharmacist",
      "images": 'Assets/Icon/pharmacist.png',
    },
    {
      "name": "Scientist",
      "images": 'Assets/Icon/scientist.png',
    },
    {
      "name": "Others",
      "images": 'Assets/Icon/others.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Step ${Provider.of<MainPageViewProvider>(context).inde.toInt() + 1} of 4",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: ((value) {
          Provider.of<MainPageViewProvider>(
            context,
            listen: false,
          ).updateIndex(ind: value.toDouble());
        }),
        // physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          // This is the first screen
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "What's your name?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "So that we know how to call you...",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 100,
                ),
                TextField(
                  autofillHints: [AutofillHints.name],
                  textInputAction: TextInputAction.next,
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    labelText: "Full Name*",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  elevation: 5,
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.ease);
                      FocusManager.instance.primaryFocus?.unfocus();
                    } else {
                      Get.showSnackbar(const GetSnackBar(
                        duration: Duration(seconds: 2),
                        message: "Please enter your name",
                        backgroundColor: Colors.redAccent,
                      ));
                    }
                  },
                  // color: Color.fromRGBO(138, 154, 91, 1),
                  color: Colors.black,
                  minWidth: Get.width,
                  height: Get.height * 0.065,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),

          // This is the second screen
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.previousPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeOut);
                      },
                      child: const Text("< Back")),
                  Text(
                    "When were you born, ${_textEditingController.text}?",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "So that we'll never forget your birthday.",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: Get.height * 0.3,
                    child: SizedBox(
                      height: 180,
                      child: CupertinoDatePicker(
                        maximumDate: DateTime.now(),
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now().subtract(
                          const Duration(
                            days: 10000,
                          ),
                        ),
                        onDateTimeChanged: (val) {
                          Provider.of<MainPageViewProvider>(context,
                                  listen: false)
                              .updateDob(dateTime: val);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    elevation: 5,
                    onPressed: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.ease);
                    },
                    color: Colors.black,
                    minWidth: Get.width,
                    height: Get.height * 0.065,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
          ),
          // This is the third screen
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.previousPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeOut);
                      },
                      child: const Text("< Back")),
                  Text(
                    "What's your gender , ${_textEditingController.text}?",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Consumer<MainPageViewProvider>(
                      builder: (context, provider, child) {
                    return Column(
                      children: List.generate(
                        3,
                        (index) => InkWell(
                          onTap: () {
                            provider.updateChoice(index: index);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 18,
                            ),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: provider.choice == index
                                  ? Colors.black
                                  : null,
                              border: Border.all(color: Colors.grey),
                            ),
                            width: Get.width,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    _gender[index]["icon"],
                                    color: provider.choice == index
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                  Text(
                                    _gender[index]["name"],
                                    style: TextStyle(
                                      color: provider.choice == index
                                          ? Colors.white
                                          : Colors.black87,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox()
                                ]),
                            // height: Get.height * 0.06,
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    elevation: 5,
                    onPressed: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.ease);
                    },
                    color: Colors.black,
                    minWidth: Get.width,
                    height: Get.height * 0.065,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
          ),

          // This is the fifth widget
          Padding(
            padding: const EdgeInsets.all(
              20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Location permission for better service.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "We will need your location permission for some features \non our plartform.",
                  // "Just a few more steps before we setup a personalised dashboard for you....",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 50,
                ),
                Lottie.asset('Assets/Lottie/location.json'),
                const SizedBox(
                  height: 50,
                ),
                RoundedLoadingButton(
                  successColor: Colors.green,
                  width: Get.width * 0.9,
                  color: Colors.black,
                  controller: _btnController,
                  onPressed: () async {
                    Map<String, dynamic> data = {
                      "user_first_name": _textEditingController.text,
                      "user_last_name": _lastName.text,
                      "gender": {
                        "gender_id": Provider.of<MainPageViewProvider>(
                              context,
                              listen: false,
                            ).choice +
                            1,
                        "label": _gender[Provider.of<MainPageViewProvider>(
                                context,
                                listen: false)
                            .choice]["name"]
                      },
                      "date_of_birth": DateFormat('yyyy-MM-dd').format(
                        Provider.of<MainPageViewProvider>(context,
                                listen: false)
                            .dob,
                      ),
                    };

                    var res = await FirebaseFirestore.instance
                        .collection("user")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .set(data)
                        .whenComplete(() {
                      _btnController.success();
                      Navigator.of(context).pushReplacement(
                        (MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        )),
                      );
                      Fluttertoast.showToast(
                          msg: "Successful",
                          textColor: Colors.white,
                          backgroundColor: Colors.green);
                    });
                  },
                  child: const Text(
                    "Enable Location",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
