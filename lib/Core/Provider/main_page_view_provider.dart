import 'package:rewear/Views/Screens/Home/New%20User/main_page_view.dart';
import 'package:flutter/cupertino.dart';

class MainPageViewProvider extends ChangeNotifier {
  double _index = 0;
  DateTime _dob = DateTime.now();
  DateTime get dob => _dob;
  double get inde => _index;
  int _choice = 0;
  int get choice => _choice;
  int _profession = 0;
  int get profession => _profession;
  updateProfession({required int prof}) {
    _profession = prof;
    notifyListeners();
  }

  updateChoice({required int index}) {
    _choice = index;
    notifyListeners();
  }

  void updateDob({required DateTime dateTime}) {
    _dob = dateTime;
    notifyListeners();
  }

  void updateIndex({required double ind}) {
    _index = ind;
    notifyListeners();
  }
}
