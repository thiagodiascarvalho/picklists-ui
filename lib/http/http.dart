import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:http/retry.dart';
import 'package:picklist_ui/models/response_model.dart';

class Http {
  static Future<dynamic> getPicklist() async {
    final String jsonString =
        await rootBundle.loadString('Json/rotas_prod.json');
    final Map jsonMap = jsonDecode(jsonString);
    final picklistUri = jsonMap.values.first;
    final Uri getUri = Uri.parse(picklistUri);
    final Map<String, String> headers = {
      "Content-Type": 'application/json',
    };

    final client = RetryClient(http.Client());
    try {
      final http.Response response = await http.get(getUri, headers: headers);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(response.statusCode);
      }
    } finally {
      client.close;
    }
  }

  static Future<dynamic> postPicklist(list) async {
    final String jsonString =
        await rootBundle.loadString('Json/rotas_prod.json');
    final Map jsonMap = jsonDecode(jsonString);
    final picklistUri = jsonMap.values.last;
    final Uri postUri = Uri.parse(picklistUri);

    final Map<String, String> headers = {
      "Content-Type": 'application/json',
    };
    final String body = jsonEncode(
      {
        "tenant": 11037,
        "grupoempresarial": "bb7a9170-bb2f-4bd7-9da6-147666a24db5",
        "ids_pick_lists": list
      },
    );
    final client = RetryClient(http.Client());
    try {
      final http.Response response =
          await http.post(postUri, body: body, headers: headers);
      return MultiStatusResponse.fromJson(jsonDecode(response.body));
    } finally {
      client.close();
    }
  }
}
