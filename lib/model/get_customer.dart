// To parse this JSON data, do
//
//     final getCustomers = getCustomersFromJson(jsonString);

import 'dart:convert';

GetCustomers getCustomersFromJson(String str) =>
    GetCustomers.fromJson(json.decode(str));

String getCustomersToJson(GetCustomers data) => json.encode(data.toJson());

class GetCustomers {
  GetCustomers({
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

  factory GetCustomers.fromJson(Map<String, dynamic> json) => GetCustomers(
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
  String zipCode;
  dynamic country;
  dynamic walletBalance;
  dynamic creditLimit;
  dynamic creditSpent;
  List<DeliveryAddress> deliveryAddresses;
  String customerType;
  dynamic dateRegistered;
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
        deliveryAddresses: json["deliveryAddresses"] == null
            ? null
            : List<DeliveryAddress>.from(json["deliveryAddresses"]
                .map((x) => DeliveryAddress.fromJson(x))),
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
        "deliveryAddresses": deliveryAddresses == null
            ? null
            : List<dynamic>.from(deliveryAddresses.map((x) => x.toJson())),
        "customerType": customerType,
        "dateRegistered": dateRegistered,
        "lastActivity": lastActivity,
        "newsletterSubscribed": newsletterSubscribed,
      };
}

class DeliveryAddress {
  DeliveryAddress({
    this.id,
    this.address,
    this.state,
    this.zipCode,
    this.location,
  });

  int id;
  String address;
  String state;
  String zipCode;
  Location location;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      DeliveryAddress(
        id: json["id"],
        address: json["address"],
        state: json["state"],
        zipCode: json["zipCode"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "state": state,
        "zipCode": zipCode,
        "location": location.toJson(),
      };
}

class Location {
  Location({
    this.id,
    this.longitude,
    this.lattitude,
  });

  int id;
  String longitude;
  String lattitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        longitude: json["longitude"],
        lattitude: json["lattitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "longitude": longitude,
        "lattitude": lattitude,
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
  dynamic phoneNo;
  dynamic email;

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
