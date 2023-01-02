import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:picklist_ui/models/picklist_model.dart';
import 'package:picklist_ui/models/response_model.dart';

class HttpMock {
  static Future<dynamic> getPicklist(String jsonPath) async {
    final jsonString = await rootBundle.loadString('Json/$jsonPath');
    final List<PickListModel> picklists = (jsonDecode(jsonString) as List)
        .map((model) => PickListModel.fromJson(model))
        .toList();
    return picklists;
  }
}
