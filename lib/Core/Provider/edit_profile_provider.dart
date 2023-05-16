import 'package:rewear/Views/Screens/Home/New%20User/main_page_view.dart';
import 'package:flutter/cupertino.dart';

class EditProfileProvider extends ChangeNotifier {
  String _profession = "";
  String get profession => _profession;
  DateTime _dob = DateTime.now().subtract(Duration(days: 3650));
  DateTime get dob => _dob;
  Map _gender = {
    "label": "Male",
    "gender_id": 1,
  };
  Map get gender => _gender;

  int _height = 170;
  int get height => _height;

  int _weight = 65;
  int get weight => _weight;

  List get bg => [
        {
          "blood_group_icon": "static/Profile/bg_a.png",
          "blood_group_id": 1,
          "blood_group_name": "A+",
          "label": "bg_a"
        },
        {
          "blood_group_icon": "static/Profile/bg_aN.png",
          "blood_group_id": 2,
          "blood_group_name": "A-",
          "label": "bg_aN"
        },
        {
          "blood_group_icon": "static/Profile/bg_ab.png",
          "blood_group_id": 3,
          "blood_group_name": "AB+",
          "label": "bg_ab"
        },
        {
          "blood_group_icon": "static/Profile/bg_abN.png",
          "blood_group_id": 4,
          "blood_group_name": "AB-",
          "label": "bg_abN"
        },
        {
          "blood_group_icon": "static/Profile/bg_b.png",
          "blood_group_id": 5,
          "blood_group_name": "B+",
          "label": "bg_b"
        },
        {
          "blood_group_icon": "static/Profile/bg_bN.png",
          "blood_group_id": 6,
          "blood_group_name": "B-",
          "label": "bg_bN"
        },
        {
          "blood_group_icon": "static/Profile/bg_o.png",
          "blood_group_id": 7,
          "blood_group_name": "O+",
          "label": "bg_o"
        },
        {
          "blood_group_icon": "static/Profile/bg_oN.png",
          "blood_group_id": 8,
          "blood_group_name": "O-",
          "label": "bg_oN"
        }
      ];

  int _bGroup = 0;
  int get bGroup => _bGroup;

  updateBg({required int index}) {
    _bGroup = index;
    notifyListeners();
  }

  updateWeight({required int weight}) {
    _weight = weight;
    notifyListeners();
  }

  updateHeight({required int height}) {
    _height = height;
    notifyListeners();
  }

  updateGender({required Map gender}) {
    _gender = gender;
    notifyListeners();
  }

  updateProfession({required String prof}) {
    _profession = prof;
    notifyListeners();
  }

  void updateDob({required DateTime dateTime}) {
    _dob = dateTime;
    notifyListeners();
  }
}
