import 'dart:convert';

import 'package:afrimash/service/network_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateDeliveryAddressService {
  NetworkHandler networkHandler = NetworkHandler();
  SharedPreferences prefs;

  createDeliveryAddress(Map<String, dynamic> data) async {
    prefs = await SharedPreferences.getInstance();
    var response = await networkHandler.postWithToken(
        "/afrimash/delivery-addresses", data);
    final Map<String, dynamic> decodedData = jsonDecode(response.body);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var deliverAddressID = decodedData['object']['id'];
        print("deliverAddressID: $deliverAddressID");
        prefs.setInt("deliverAddressID", deliverAddressID);
        return {'success': true, 'message': decodedData};
      } else {
        return {'success': false, 'message': decodedData['errorMsg']};
      }
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': decodedData};
    }
  }
}
