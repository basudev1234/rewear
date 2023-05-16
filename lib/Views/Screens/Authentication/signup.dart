import 'package:rewear/Views/Screens/Authentication/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Core/Provider/auth_provider.dart';
import '../../../Core/Server/request.dart';

class Signup extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
            child: TextButton(
          child: const Text("Already have a account?  Login"),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (context) => AuthScreen(),
              ),
            );
          },
        )),
        body: Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            child: Consumer<AuthProvider>(builder: (context, authP, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'Assets/logo/Archive/Logo,Name_Original@4x.png',
                    height: Get.height * 0.13,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Welcome,",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      labelText: "Phone , email or EH id",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: authP.visible,
                    child: TextField(
                      obscureText: authP.obs,
                      controller: _textEditingController1,
                      decoration: InputDecoration(
                        suffix: IconButton(
                          onPressed: () {
                            authP.toggle();
                          },
                          icon: authP.obs
                              ? const Icon(CupertinoIcons.eye)
                              : const Icon(
                                  CupertinoIcons.eye_slash,
                                ),
                        ),
                        labelText: "Password",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  MaterialButton(
                    elevation: 5,
                    onPressed: () {
                      if (_textEditingController.text.isNotEmpty) {
                        if (authP.Check.flag) {
                        } else {
                          Server().verifyUser(
                              emailOrMob: _textEditingController.text,
                              context: context,
                              countryCode: '');
                        }
                      } else {
                        Get.showSnackbar(const GetSnackBar(
                          duration: Duration(seconds: 2),
                          message: "Please enter email , phone or EH id",
                          backgroundColor: Colors.redAccent,
                        ));
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    minWidth: Get.width,
                    height: Get.height * 0.065,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      authP.Check.flag ? "Verify" : "Get Started",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              );
            }),
          ),
        ));
  }
}
