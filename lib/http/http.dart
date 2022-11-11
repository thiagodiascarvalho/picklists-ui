import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/retry.dart';

import '../models/response_model.dart';

class Http {
  static Future<dynamic> getPicklist() async {
    final Uri getUri = Uri.parse(
        'https://api.nasajon.com.br/integrador-vendas/pick-lists?tenant=123&grupoempresarial=bb7a9170-bb2f-4bd7-9da6-147666a24db5');
    // final String jsonString = await rootBundle.loadString('Json/rotas.json');
    // final Map jsonMap = jsonDecode(jsonString);
    // final picklistUri = jsonMap.values.first;
    // final Uri getUri = Uri.parse(picklistUri);
    final Map<String, String> headers = {
      "Content-Type": 'application/json',
    };

    final client = RetryClient(http.Client());
    try {
      final Response response = await http.get(getUri, headers: headers);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(response.statusCode);
      }
    } finally {
      client.close();
    }
  }

  static Future<MultiStatusResponse> postPicklist(list) async {
    final Uri postUri = Uri.parse(
        'https://api.nasajon.com.br/integrador-vendas/liberacao-pick-lists');
    // final String jsonString = await rootBundle.loadString('Json/rotas.json');
    // final Map jsonMap = jsonDecode(jsonString);
    // final picklistUri = jsonMap.values.last;
    // final Uri postUri = Uri.parse(picklistUri);

    final Map<String, String> headers = {
      "Content-Type": 'application/json',
    };

    final body = jsonEncode(
      {
        "tenant": 123,
        "grupoempresarial": "bb7a9170-bb2f-4bd7-9da6-147666a24db5",
        "ids_pick_lists": list
      },
    );
    final client = RetryClient(http.Client());
    try {
      final Response response =
          await http.post(postUri, body: body, headers: headers);

      return MultiStatusResponse.fromJson(jsonDecode(response.body));
    } finally {
      client.close();
    }
  }
}
