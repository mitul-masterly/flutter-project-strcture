class LoginRequestModel {
  String? emailId;
  String? userPassword;
  String? appVersion;
  String? deviceToken;
  String? deviceType;
  String? deviceId;
  String? deviceName;

  LoginRequestModel({
    required this.emailId,
    required this.userPassword,
    required this.appVersion,
    required this.deviceToken,
    required this.deviceType,
    required this.deviceId,
    required this.deviceName,
  });

  LoginRequestModel.fromJson(final Map<String, dynamic> json) {
    emailId = json['emailId'];
    userPassword = json['userPassword'];
    appVersion = json['appVersion'];
    deviceToken = json['deviceToken'];
    deviceType = json['deviceType'];
    deviceId = json['deviceId'];
    deviceName = json['deviceName'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'emailId': emailId,
      'userPassword': userPassword,
      'appVersion': appVersion,
      'deviceToken': deviceToken,
      'deviceType': deviceType,
      'deviceId': deviceId,
      'deviceName': deviceName,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
