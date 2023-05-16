import 'package:flutter/material.dart';

import '../Model/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<bool> _list = List.generate(category.length, (index) => false);
  List<bool> get boolList => _list;
  void addindex(int index, bool isOpen) {
    _list[index] = !isOpen;
    notifyListeners();
  }
}
