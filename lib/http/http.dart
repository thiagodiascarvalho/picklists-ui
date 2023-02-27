import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:flutter_global_dependencies/flutter_global_dependencies.dart';
import 'package:nsj_flutter_login/nsj_login.dart';
import 'package:picklist_ui/models/picklist_model.dart';
import 'package:picklist_ui/models/response_model.dart';

class Http {
  static Future<List<PickListModel>> getPicklist(String statusFilter) async {
    // final String jsonString =
    //     await rootBundle.loadString('Json/rotas_prod.json');
    // final Map jsonMap = jsonDecode(jsonString);
    // final picklistUri = jsonMap.values.first;
    final Uri getUri = Uri.parse(
        'https://integrador-vmpay-inyrb33hja-uc.a.run.app/integrador-vendas/pick-lists?tenant=123&grupoempresarial=bb7a9170-bb2f-4bd7-9da6-147666a24db5&status=$statusFilter');

    final Token? token = await Modular.get<ProfileStore>().tokenUpdated;
    final Map<String, String> headers = {
      "Content-Type": 'application/json',
      "Authorization": 'Bearer ${token?.accessToken ?? ""}'
    };

    final client = RetryClient(http.Client());
    try {
      final http.Response response = await http.get(getUri, headers: headers);
      if (response.statusCode == 200) {
        final List<PickListModel> picklists =
            (jsonDecode(response.body)["result"] as List)
                .map((e) => PickListModel.fromJson(e))
                .toList();
        print(picklists);
        return picklists;
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
          await http.post(postUri, body: body, headers: headers).timeout(
                const Duration(seconds: 60),
              );
      return MultiStatusResponse.fromJson(jsonDecode(response.body));
    } on TimeoutException catch (_) {
      return TimeoutException;
    } finally {
      client.close();
    }
  }
}
