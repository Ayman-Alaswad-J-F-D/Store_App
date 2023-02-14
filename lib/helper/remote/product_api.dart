// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductsApi {
  static Future<dynamic> get({
    required String url,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Exception: Error Status Code ${response.statusCode}");
      return throw Exception(
          "There is problem in status code ${response.statusCode}");
    }
  }

  static Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      "Content-Type": "application/x-www-form-urlencoded",
    });
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    print('url = $url\n body = $body\n token = $token');

    http.Response response = await http.post(
      Uri.parse(url),
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
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    print('url = $url\n body = $body\n token = $token');
    http.Response response = await http.put(
      Uri.parse(url),
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
