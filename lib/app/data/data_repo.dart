import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';

class DataRepo {
  static Future<Map<String, dynamic>> loadData() async {
    try {
      final String fileString =
          await rootBundle.loadString('assets/jsons/data.json');
      final Map<String, dynamic> data =
          await jsonDecode(fileString).toList()[0];
      return data;
    } catch (e) {
      log('ERROR HERE: $e');
      throw Exception(e);
    }
  }
}
