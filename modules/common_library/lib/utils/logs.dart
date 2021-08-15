import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

/// enable network proxy
const debugNetworkProxy = false;

/// Logging config
void printLog([dynamic data, DateTime startTime]) {
  if (foundation.kDebugMode) {
    var time = '';
    if (startTime != null) {
      final endTime = DateTime.now().difference(startTime);
      final icon = endTime.inMilliseconds > 2000
          ? '⌛️Slow-'
          : endTime.inMilliseconds > 1000
              ? '⏰Medium-'
              : '⚡️Fast-';
      time = '[$icon${endTime.inMilliseconds}ms]';
    }

    try {
      final now = DateFormat('h:mm:ss-ms').format(DateTime.now());
      debugPrint('ℹ️[${now}ms]$time${data.toString()}');
    } catch (e) {
      debugPrint('${data.toString()}');
    }
  }
}

/// The default http GET that support Logging
Future<http.Response> httpGet(Uri url, {Map<String, String> headers}) async {
  final startTime = DateTime.now();
  final response = await http.get(url, headers: headers);
  printLog('GET:$url', startTime);
  return response;
}

/// The default http POST that support Logging
Future<http.Response> httpPost(Uri url,
    {Map<String, String> headers, Object body}) async {
  final startTime = DateTime.now();
  final response = await http.post(url, headers: headers, body: body);
  printLog('POST:$url', startTime);
  return response;
}

/// The default http PUT that support Logging
Future<http.Response> httpPut(Uri url,
    {Map<String, String> headers, Object body}) async {
  final startTime = DateTime.now();
  final response = await http.put(url, headers: headers, body: body);
  printLog('PUT:$url', startTime);
  return response;
}

/// The default http PUT that support Logging
Future<http.Response> httpDelete(Uri url,
    {Map<String, String> headers, Object body}) async {
  final startTime = DateTime.now();
  final response = await http.delete(url, headers: headers, body: body);
  printLog('DELETE:$url', startTime);
  return response;
}

/// The default http PATCH that support Logging
Future<http.Response> httpPatch(Uri url,
    {Map<String, String> headers, Object body}) async {
  final startTime = DateTime.now();
  final response = await http.patch(url, headers: headers, body: body);
  printLog('DELETE:$url', startTime);
  return response;
}
