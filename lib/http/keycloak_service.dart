import 'dart:convert';
import 'dart:ui';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KeyCloak {
  static Uri sendToKeycoak(state, nonce, redirectUrl) {
    final uri = Uri.https('auth.dev.nasajonsistemas.com.br',
        'auth/realms/DEV/protocol/openid-connect/auth', {
      'client_id': 'picklist',
      'redirect_uri': '$redirectUrl',
      'state': '$state',
      'response_mode': 'fragment',
      'response_type': 'code',
      'scope': 'openid',
      'nonce': '$nonce'
    });
    return uri;
  }

  static Future<dynamic> getToken(code, clientId, redirectUri) async {
    final Uri tokenUri = Uri.parse(
        'https://auth.dev.nasajonsistemas.com.br/auth/realms/DEV/protocol/openid-connect/token');
    final Map<String, String> headers = {
      "Content-Type": 'application/x-www-form-urlencoded',
    };
    final String body =
        "code=$code&grant_type=authorization_code&client_id=$clientId&redirect_uri=$redirectUri";

    final http.Response response =
        await http.post(tokenUri, headers: headers, body: body);

    print(jsonDecode(response.body));
  }
}
