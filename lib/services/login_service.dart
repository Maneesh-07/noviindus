import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noviindus/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices extends ChangeNotifier {
  Future<String> sendAuth(
    String username,
    String password,
  ) async {
    final Uri uri = Uri.parse('${Config.apibaseUrl}LoginApi');

    final SharedPreferences sharedPref = await SharedPreferences.getInstance();

    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        }, // Update content type
        body: {
          'username': username,
          'password': password.toString(),
        },
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        final token = result["access_token"];
        print('Login successfully!');
        sharedPref.setString("access_token", token);
        sharedPref.setString('displayName', username);
        return 'Login success';
      } else {
        // Handle error based on the server response content
        var errorResponse = jsonDecode(response.body);
        showToast(errorResponse["message"] ?? 'Login failed');
        return 'Login failed';
      }
    } catch (e) {
      // Handle exceptions
      print('Error during login: $e');
      showToast('Error during login. Please try again.');
      return 'Login failed';
    }
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1000,
      backgroundColor: Colors.black.withOpacity(0.7),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
   logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
  }
}
