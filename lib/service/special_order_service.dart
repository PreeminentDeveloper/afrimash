import 'dart:convert';

import 'package:afrimash/service/network_handler.dart';

class SepcialOrderService {
  NetworkHandler networkHandler = NetworkHandler();

  specialOrder(Map<String, dynamic> data) async {
    var response =
        await networkHandler.postWithToken("/afrimash/special-orders", data);
    final Map<String, dynamic> decodedData = jsonDecode(response.body);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
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
