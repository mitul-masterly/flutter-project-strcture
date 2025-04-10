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
  String? dateOfBirth;
  String? gender;
  String? county;
  String? address;
  String? securityQuestion;
  String? securityAnswer;
  bool? privacyPolicy;
  bool? termsAndConditions;

  SignupRequest(
      {this.firstName,
      this.lastName,
      this.emailId,
      this.contactNo,
      this.isdCode,
      this.userPassword,
      this.countryCodeISO2,
      this.createdByDeviceName,
      this.createdByDeviceTypeId,
      this.address,
      this.gender,
      this.county,
      this.dateOfBirth,
        this.securityAnswer,
        this.privacyPolicy,
        this.securityQuestion,
        this.termsAndConditions

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
    address = json['address'];
    gender = json['gender'];
    county = json['county'];
    dateOfBirth = json['dateOfBirth'];
    securityAnswer = json['securityAnswer'];
    securityQuestion = json['securityQuestion'];
    privacyPolicy = json['privacyPolicy'];
    termsAndConditions = json['termsAndConditions'];
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
      'address': address,
      'gender': gender,
      'county': county,
      'dateOfBirth': dateOfBirth,
      'securityAnswer': securityAnswer,
      'securityQuestion': securityQuestion,
      'privacyPolicy': privacyPolicy,
      'termsAndConditions': termsAndConditions,
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
        createdByDeviceTypeId,
        address,
        gender,
        county,
        dateOfBirth,
    securityAnswer,
    securityQuestion,
    privacyPolicy,
    termsAndConditions
      ];
}
