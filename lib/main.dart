import 'package:rewear/Core/Model/main_model.dart';
import 'package:rewear/Core/Provider/auth_provider.dart';
import 'package:rewear/Core/Provider/carousel.dart';
import 'package:rewear/Core/Provider/choice_chip_provider.dart';
import 'package:rewear/Core/Provider/main_page_view_provider.dart';
import 'package:rewear/Core/Provider/main_screen_provider.dart';
import 'package:rewear/Core/Provider/profile_provider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:rewear/Views/Screens/Home/Main%20Screens/main_screen.dart';
import 'package:rewear/Views/Screens/Home/New%20User/main_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Core/Provider/edit_profile_provider.dart';
import 'Views/Screens/Authentication/gate_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  evaluateH.sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );

  runApp(
    const GetMaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainPageViewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Carousel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChoiceChipProvider(),
        ),
      ],
      child: FirebasePhoneAuthProvider(
        child: MaterialApp(
          title: 'Rewear',
          theme: ThemeData(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              elevation: 0,
              backgroundColor: Color(0XFFF7FBFF),
              selectedItemColor: Color.fromRGBO(29, 185, 84, 1),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromRGBO(29, 185, 84, 1),
            ),
          ),
          home: GateScreen(),
        ),
      ),
    );
  }
}
