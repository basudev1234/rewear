import 'package:rewear/Core/Model/user.dart';
import 'package:rewear/Core/Server/request.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  check _check = check(
    "",
    false,
  );
  check get Check => _check;
  bool visible = false;
  bool obs = true;

  toggle() {
    obs = !obs;
    notifyListeners();
  }

  verifyUser({required check Ch}) async {
    _check = Ch;
    visible = true;
    print(Ch.flag);

    notifyListeners();
  }
}
