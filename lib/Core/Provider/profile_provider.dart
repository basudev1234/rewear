import 'package:rewear/Core/Server/request.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  Map _allergy = {};
  Map get allergy => _allergy;
  Map _profileData = {};
  Map get profileData => _profileData;

  void updateProfileData() async {
    var data = await Server().fetchProfile();
    _profileData = data;
    notifyListeners();
  }

  void updateAllergy({required Map allergy}) {
    _allergy = allergy;
    notifyListeners();
  }

  List _value = [
    {"0": false},
    {"1": false},
    {"2": false},
    {"3": false},
  ];
  List get value => _value;

  void updateIndex({required int index, required bool value}) {
    // _value.up
    // notifyListeners();
  }
}
