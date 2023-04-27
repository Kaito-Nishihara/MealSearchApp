import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mealsearchapp/model/http_request.dart';

import 'api_handler.dart';

class HotpepperApi extends ApiHandler {
  Future<void> getRestaurant() async {
    var request = Request(url: "", headers: "");
    var result = await getData(request);

    var jsonResponse = jsonDecode(result.body);

    
  }
}
