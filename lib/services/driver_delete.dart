import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:noviindus/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DriverDeletePostServices extends ChangeNotifier {
  Future<String> sendDriverDetails(
      String driverid,) async {
    final Uri uri = Uri.parse('${Config.apibaseUrl}DriverApi');

    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    final String? token = sharedPref.getString('access_token');

    try {
      final response = await http.post(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'driver_id': driverid,
        },
      );

      if (response.statusCode == 200) {
        // var result = jsonDecode(response.body);
        print('success');
        return 'Success';
      } else {
        // Handle error based on the server response content
        var errorResponse = jsonDecode(response.body);
        print(errorResponse);
        return 'failed to Proccess';
      }
    } catch (e) {
      // Handle exceptions
      print('Error during login: $e');

      return ' failed';
    }
  }
}
