import 'package:flutter/material.dart';

class Carousel extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void updateIndex({required int index}) {
    _index = index;
    print(_index);
    notifyListeners();
  }
}
