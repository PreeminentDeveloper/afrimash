// To parse this JSON data, do
//
//     final getLoggedInDetails = getLoggedInDetailsFromJson(jsonString);

import 'dart:convert';

GetLoggedInDetails getLoggedInDetailsFromJson(String str) =>
    GetLoggedInDetails.fromJson(json.decode(str));

String getLoggedInDetailsToJson(GetLoggedInDetails data) =>
    json.encode(data.toJson());

class GetLoggedInDetails {
  GetLoggedInDetails({
    this.object,
    this.errorMsg,
    this.expiryDate,
    this.timestamp,
    this.errorCode,
    this.status,
  });

  Object object;
  dynamic errorMsg;
  dynamic expiryDate;
  DateTime timestamp;
  dynamic errorCode;
  String status;

  factory GetLoggedInDetails.fromJson(Map<String, dynamic> json) =>
      GetLoggedInDetails(
        object: Object.fromJson(json["object"]),
        errorMsg: json["errorMsg"],
        expiryDate: json["expiryDate"],
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["errorCode"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "object": object.toJson(),
        "errorMsg": errorMsg,
        "expiryDate": expiryDate,
        "timestamp": timestamp.toIso8601String(),
        "errorCode": errorCode,
        "status": status,
      };
}

class Object {
  Object({
    this.id,
    this.loyaltyNo,
    this.loyaltyPoint,
    this.homephoneNo,
    this.user,
    this.mobileNo,
    this.workphoneNo,
    this.email,
    this.salutation,
    this.firstName,
    this.lastName,
    this.fullName,
    this.dob,
    this.referralCode,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.walletBalance,
    this.creditLimit,
    this.creditSpent,
    this.deliveryAddresses,
    this.customerType,
    this.dateRegistered,
    this.lastActivity,
    this.newsletterSubscribed,
  });

  int id;
  dynamic loyaltyNo;
  dynamic loyaltyPoint;
  dynamic homephoneNo;
  User user;
  String mobileNo;
  dynamic workphoneNo;
  String email;
  dynamic salutation;
  String firstName;
  String lastName;
  dynamic fullName;
  dynamic dob;
  dynamic referralCode;
  dynamic address;
  dynamic city;
  String state;
  dynamic zipCode;
  dynamic country;
  dynamic walletBalance;
  dynamic creditLimit;
  dynamic creditSpent;
  List<dynamic> deliveryAddresses;
  String customerType;
  String dateRegistered;
  dynamic lastActivity;
  bool newsletterSubscribed;

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        id: json["id"],
        loyaltyNo: json["loyaltyNo"],
        loyaltyPoint: json["loyaltyPoint"],
        homephoneNo: json["homephoneNo"],
        user: User.fromJson(json["user"]),
        mobileNo: json["mobileNo"],
        workphoneNo: json["workphoneNo"],
        email: json["email"],
        salutation: json["salutation"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        dob: json["dob"],
        referralCode: json["referralCode"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zipCode"],
        country: json["country"],
        walletBalance: json["walletBalance"],
        creditLimit: json["creditLimit"],
        creditSpent: json["creditSpent"],
        deliveryAddresses:
            List<dynamic>.from(json["deliveryAddresses"].map((x) => x)),
        customerType: json["customerType"],
        dateRegistered: json["dateRegistered"],
        lastActivity: json["lastActivity"],
        newsletterSubscribed: json["newsletterSubscribed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "loyaltyNo": loyaltyNo,
        "loyaltyPoint": loyaltyPoint,
        "homephoneNo": homephoneNo,
        "user": user.toJson(),
        "mobileNo": mobileNo,
        "workphoneNo": workphoneNo,
        "email": email,
        "salutation": salutation,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "dob": dob,
        "referralCode": referralCode,
        "address": address,
        "city": city,
        "state": state,
        "zipCode": zipCode,
        "country": country,
        "walletBalance": walletBalance,
        "creditLimit": creditLimit,
        "creditSpent": creditSpent,
        "deliveryAddresses":
            List<dynamic>.from(deliveryAddresses.map((x) => x)),
        "customerType": customerType,
        "dateRegistered": dateRegistered,
        "lastActivity": lastActivity,
        "newsletterSubscribed": newsletterSubscribed,
      };
}

class User {
  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.costPerHour,
    this.signedIn,
    this.phoneNo,
    this.email,
  });

  int id;
  String username;
  dynamic firstName;
  dynamic lastName;
  dynamic costPerHour;
  dynamic signedIn;
  String phoneNo;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        costPerHour: json["costPerHour"],
        signedIn: json["signedIn"],
        phoneNo: json["phoneNo"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "costPerHour": costPerHour,
        "signedIn": signedIn,
        "phoneNo": phoneNo,
        "email": email,
      };
}
