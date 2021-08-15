import 'dart:convert';

import 'package:afrimash/model/get_customer.dart';
import 'package:afrimash/service/network_handler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService {
  GetCustomers _getCustomer = GetCustomers();
  NetworkHandler networkHandler = NetworkHandler();
  SharedPreferences prefs;

  GetCustomers get getCustomer => _getCustomer;

  registerUser(Map<String, dynamic> data) async {
    prefs = await SharedPreferences.getInstance();
    var response =
        await networkHandler.postWithoutToken("/afrimash/customers", data);
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Successful reg");
        var userID = decodedResponse['object']['id'];
        print(userID);
        prefs.setInt("userID", userID);
        _getCustomer = GetCustomers.fromJson(decodedResponse);
        return {'success': true, 'message': decodedResponse['object']};
      } else {
        return {'success': false, 'message': decodedResponse['errorMsg']};
      }
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': decodedResponse['errorMsg']};
    }
  }
}
