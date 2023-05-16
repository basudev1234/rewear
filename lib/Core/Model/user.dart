class check {
  final String message;
  final bool flag;

  check(
    this.message,
    this.flag,
  );
  factory check.fromMap(Map<String, dynamic> json) {
    return check(
      json["message"],
      json["flag"],
    );
  }
  factory check.fromJson(Map<String, dynamic> json) {
    return check(
      json["message"] ?? "",
      json["flag"] ?? "",
    );
  }
}

class WelcomeData {
  final String message;
  final bool flag;

  WelcomeData(
    this.message,
    this.flag,
  );
  factory WelcomeData.fromMap(Map<String, dynamic> json) {
    return WelcomeData(
      json["message"],
      json["flag"],
    );
  }
  factory WelcomeData.fromJson(Map<String, dynamic> json) {
    return WelcomeData(
      json["message"] ?? "",
      json["flag"] ?? "",
    );
  }
}
