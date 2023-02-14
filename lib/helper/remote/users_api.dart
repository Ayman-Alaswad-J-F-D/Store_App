// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/app/constants.dart';

class UsersApi {
  static Future<dynamic> get({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    Map<String, String> headers = {
      'lang': lang,
    };

    if (token != null) {
      headers.addAll({
        'lang': lang,
        // 'Content-Type': 'application/json',
        'Authorization': token,
      });
    }

    http.Response response = await http.get(
      Uri.parse("$baseUrlUsers/$url"),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('url = $url\ntoken = $token\n${response.body}');

      return jsonDecode(response.body);
    } else {
      print("Exception: Error Status Code ${response.statusCode}");
      return throw Exception(
          "There is problem in status code ${response.statusCode}");
    }
  }

  static Future<dynamic> post({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
    String lang = 'en',
    String? token,
  }) async {
    Map<String, String> headers = {
      'lang': lang,
    };

    if (token != null) {
      headers.addAll({
        'lang': lang,
        // 'Content-Type': 'application/json',
        'Authorization': token,
      });
    }
    print('url = $url\nbody = $body\ntoken = $token');

    http.Response response = await http.post(
      Uri.parse("$baseUrlUsers/$url"),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);

      return jsonDecode(response.body);
    } else {
      print("Exception: Error Status Code ${response.statusCode}");
      return throw Exception(
        "There is problem in status code ${response.statusCode} with body ${jsonDecode(response.body)}",
      );
    }
  }

  static Future<dynamic> put({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
    String lang = 'en',
    String? token,
  }) async {
    Map<String, String> headers = {
      'lang': lang,
    };

    if (token != null) {
      headers.addAll({
        'lang': lang,
        // 'Content-Type': 'application/json',
        'Authorization': token,
      });
    }
    print('url = $url\n body = $body\n token = $token');
    http.Response response = await http.put(
      Uri.parse("$baseUrlUsers/$url"),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print("Exception: Error Status Code ${response.statusCode}");
      return throw Exception(
        "There is problem in status code ${response.statusCode} with body ${jsonDecode(response.body)}",
      );
    }
  }
}
