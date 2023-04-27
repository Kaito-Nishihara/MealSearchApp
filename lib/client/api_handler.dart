import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/http_request.dart';

abstract class ApiHandler {
  Future<dynamic> getData(Request request) async {
    var response = await http.get(Uri.https(
        'www.googleapis.com',
        '/books/v1/volumes',
        {'q': '{Flutter}', 'maxResults': '40', 'langRestrict': 'ja'}));

    return response.body;
    //var jsonResponse = jsonDecode(response.body);
  }
}
