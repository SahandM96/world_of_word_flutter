import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

abstract class MyClient {
  Future<http.Response> get(
    String endpoint, [
    Map<String, dynamic>? queryParams,
  ]);

  Future<http.Response> post(String endpoint, Map<String, dynamic> payload);
}

class MyHttpClient implements MyClient {
  final String _baseUrl;

  MyHttpClient(this._baseUrl);
  Map<String, String> get _headers => {
        HttpHeaders.contentTypeHeader: 'application/json',
      };

  Uri _buildUri(String endpoint, [Map<String, dynamic>? queryParams]) {
    return Uri.https(_baseUrl, endpoint, queryParams);
  }

  @override
  Future<http.Response> get(String endpoint,
      [Map<String, dynamic>? queryParams]) {
    return http.get(_buildUri(endpoint, queryParams), headers: _headers);
  }

  @override
  Future<http.Response> post(String endpoint, Map<String, dynamic> payload) {
    return http.post(_buildUri(endpoint),
        body: jsonEncode(payload), headers: _headers);
  }
}
