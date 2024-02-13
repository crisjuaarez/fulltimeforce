import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../../core/constants/api_constants.dart';

class CommitsDataSource {
  Future<http.Response> getCommits(String username, String repoName) async {
    final response = await http
        .get(
          Uri.parse(
              '${ApiConstants.baseUrl}/repos/$username/$repoName/commits'),
          headers: {
            'Accept': 'application/vnd.github+json',
            'Authorization': 'Bearer ${ApiConstants.token}',
            'X-GitHub-Api-Version': '2022-11-28',
          },
        )
        .timeout(const Duration(seconds: 10))
        .onError((e, stackTrace) {
          log('Error: ${e.toString()}');
          log('StackTrace ${stackTrace.toString()}');
          return http.Response('Something went wrong', 500);
        })
        .catchError(
          (e) {
            log('Error: ${e.toString()}');
            return http.Response('Something went wrong', 500);
          },
        );
    log(response.body);
    return response;
  }
}
