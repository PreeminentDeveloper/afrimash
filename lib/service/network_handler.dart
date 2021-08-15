import 'dart:convert';

// import 'package:elderlydoc/Provider/logging_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
// import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkHandler {
  // Client http = HttpClientWithInterceptor.build(interceptors: [
  //   // LoggingInterceptor(),
  // ]);

  String baseUrl = "https://api.afrimash.com";
  var log = Logger();
  FlutterSecureStorage storage = FlutterSecureStorage();
  SharedPreferences prefs;

  // get request
  Future getWithoutToken(String urlPath) async {
    // url = formater(url);
    var url = Uri.parse('https://api.afrimash.com' + urlPath);
    var response = await http.get(
      url,
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return json.decode(response.body);
      }
      log.i(response.body);
      log.i(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getWithToken(String urlPath) async {
    var url = Uri.parse('https://api.afrimash.com' + urlPath);
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // url = formater(url);
    var response = await http.get(
      url,
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return json.decode(response.body);
      }
      log.i(response.body);
      log.i(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
  }

  // post request without token
  Future<dynamic> postWithoutToken(
      String urlPath, Map<String, dynamic> body) async {
    // url = formater(url);
    var url = Uri.parse('https://api.afrimash.com' + urlPath);
    var response = await http.post(url,
        headers: {"content-type": "application/json"}, body: json.encode(body));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        print("Wrong credentials");
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // post request with token
  Future<dynamic> postWithToken(
      dynamic urlPath, Map<String, dynamic> body) async {
    var url = Uri.parse('https://api.afrimash.com' + urlPath);
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // url = formater(url);
    var response = await http.post(url,
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode(body));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // patch request
  Future<dynamic> patch2(dynamic url, Map<String, dynamic> data) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    var response = await http.patch(url,
        headers: {"Authorization": "Bearer $token"}, body: jsonEncode(data));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        print("Wrong credentials");
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> patch(dynamic url, Map<String, dynamic> data) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    var response = await http.patch(url,
        headers: {"Authorization": "Bearer $token"}, body: data);

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        print("Wrong credentials");
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // put request
  Future<dynamic> put(dynamic url, Map<String, dynamic> data) async {
    url = formater(url);
    var response = await http.put(url,
        headers: {"Content-type": "application/json"}, body: jsonEncode(data));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        print("Wrong credentials");
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> putWithToken(dynamic url, Map<String, dynamic> data) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    var response = await http.put(url,
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(data));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        print("Wrong credentials");
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> delete(dynamic url, Map<String, dynamic> data) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    var response = await http.put(url,
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(data));

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return response;
      } else {
        print("Wrong credentials");
        log.d(response.body);
        log.d(response.statusCode);
        return response;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  String formater(String url) {
    return baseUrl + url;
  }

  NetworkImage getImage(String username) {
    //change endpoint to the right endpoint
    String url = formater("/upload//$username.jpg");
    return NetworkImage(url);
  }
}
