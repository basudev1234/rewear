import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MainScreenProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void updateIndex({required int index}) {
    _index = index;
    notifyListeners();
  }
}
