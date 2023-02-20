import 'dart:convert';

import 'package:book_app/commons/networking/api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class NetworkUtils {
  static Future<T> fetchAPI<T>({
    String? path,
    required T Function(Map<String, dynamic>) parser,
  }) async {
    final url = path != null ? ApiServices.baseUrl + path : ApiServices.baseUrl;
    print(url);

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      final parsedJson = jsonDecode(response.body) as Map<String, dynamic>;
      return parser(parsedJson);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}
