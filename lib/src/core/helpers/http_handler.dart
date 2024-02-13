import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';

class HttpHandler {
  static const _defaultHeaders = {
    'Accept': 'application/vnd.github+json',
    'Authorization': 'Bearer ${ApiConstants.token}',
    'X-GitHub-Api-Version': '2022-11-28',
  };
  static final _defaultResponse = http.Response('Something went wrong', 500);

  Future<http.Response> get(String url) {
    final response = http
        .get(Uri.parse(url), headers: _defaultHeaders)
        .timeout(const Duration(seconds: 10))
        .onError(
      (e, stackTrace) {
        log('Error: ${e.toString()}');
        log('StackTrace ${stackTrace.toString()}');
        return _defaultResponse;
      },
    ).catchError(
      (e) {
        log('Error: ${e.toString()}');
        return _defaultResponse;
      },
    );

    return response;
  }
}
