import 'package:flutter/material.dart';

class ChoiceChipProvider with ChangeNotifier {
  int _choice = 0;
  int get choice => _choice;

  void updateChoice({required int choice}) {
    _choice = choice;
    notifyListeners();
  }
}
