class UserDataModel {
  int? userRegistrationId;
  String? authToken;
  String? firstName;
  String? lastName;
  String? userName;
  String? emailId;
  String? isdCode;
  String? contactNo;
  String? dateofBirth;
  String? userProfileImagePath;
  String? userProfileImageName;
  String? userProfileImageUrl;
  String? preferredCurrency;
  String? currencySign;
  String? countryCodeISO2;

  String get fullName => '$firstName $lastName';

  UserDataModel({this.userRegistrationId,
    this.authToken,
    this.firstName,
    this.lastName,
    this.userName,
    this.emailId,
    this.isdCode,
    this.contactNo,
    this.dateofBirth,
    this.userProfileImagePath,
    this.userProfileImageName,
    this.userProfileImageUrl,
    this.currencySign,
    this.preferredCurrency,
    this.countryCodeISO2});

  UserDataModel.fromJson(final Map<String, dynamic> json) {
    userRegistrationId = json['userRegistrationId'];
    authToken = json['authToken'];
    firstName = json['firstName'] ?? '';
    lastName = json['lastName'] ?? '';
    userName = json['userName'] ?? '';
    emailId = json['emailId'] ?? '';
    isdCode = json['isdCode'] ?? '';
    contactNo = json['contactNo'] ?? '';
    dateofBirth = json['dateofBirth'];
    userProfileImagePath = json['userProfileImagePath'];
    userProfileImageName = json['userProfileImageName'];
    userProfileImageUrl = json['userProfileImageUrl'];
    preferredCurrency = json['preferredCurrency'];
    currencySign = json['currencySign'];
    countryCodeISO2 = json['countryCodeISO2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userRegistrationId'] = userRegistrationId;
    data['authToken'] = authToken;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userName'] = userName;
    data['emailId'] = emailId;
    data['isdCode'] = isdCode;
    data['contactNo'] = contactNo;
    data['dateofBirth'] = dateofBirth;
    data['userProfileImagePath'] = userProfileImagePath;
    data['userProfileImageName'] = userProfileImageName;
    data['userProfileImageUrl'] = userProfileImageUrl;
    data['preferredCurrency'] = preferredCurrency;
    data['currencySign'] = currencySign;
    data['countryCodeISO2'] = countryCodeISO2;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}
