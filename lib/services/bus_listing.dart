import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:noviindus/config/config.dart';
import 'package:noviindus/model/bus_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BusProviderServices extends ChangeNotifier {
  Future<List<Bus>> fetchBus() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    final String? token = sharedPref.getString('access_token');

    try {
      final response = await http.get(
        Uri.parse("${Config.apibaseUrl}BusListApi"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);

        if (responseData is List) {
          print('API Response: ${response.body}');
          List<Bus> users = responseData
              .map((json) => Bus.fromJson(json as Map<String, dynamic>))
              .toList();
          return users;
        } else if (responseData is Map<String, dynamic> &&
            responseData.containsKey('bus')) {
          final List<Bus> users = List<Bus>.from(
            responseData['bus'].map((json) => Bus.fromJson(json)),
          );
          return users;
        } else {
          print(
              'Invalid data format. Expected a List or a Map with a "data" field.');
          throw Exception('Failed to load users');
        }
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get data $e');
    }
  }
}
