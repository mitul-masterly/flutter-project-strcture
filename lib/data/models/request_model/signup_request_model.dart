import 'package:equatable/equatable.dart';

class SignupRequest extends Equatable {
  String? firstName;
  String? lastName;
  String? emailId;
  String? contactNo;
  String? isdCode;
  String? userPassword;
  String? countryCodeISO2;
  String? createdByDeviceName;
  String? createdByDeviceTypeId;

  SignupRequest({
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.contactNo,
    required this.isdCode,
    required this.userPassword,
    required this.countryCodeISO2,
    required this.createdByDeviceName,
    required this.createdByDeviceTypeId,
  });

  SignupRequest.fromJson(final Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailId = json['emailId'];
    contactNo = json['contactNo'];
    isdCode = json['isdCode'];
    userPassword = json['userPassword'];
    countryCodeISO2 = json['countryCodeISO2'];
    createdByDeviceName = json['CreatedByDeviceName'];
    createdByDeviceTypeId = json['CreatedByDeviceTypeId'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'emailId': emailId,
      'contactNo': contactNo,
      'isdCode': isdCode,
      'userPassword': userPassword,
      'countryCodeISO2': countryCodeISO2,
      'CreatedByDeviceName': createdByDeviceName,
      'CreatedByDeviceTypeId': createdByDeviceTypeId,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        firstName,
        lastName,
        emailId,
        contactNo,
        userPassword,
        isdCode,
        countryCodeISO2,
        createdByDeviceName,
        createdByDeviceTypeId
      ];
}
