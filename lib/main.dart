import 'package:flutter/material.dart';
import 'package:nsj_flutter_login/nsj_login.dart';
import 'package:picklist_ui/themes/picklist_theme.dart';

import 'screens/pickList_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: picklistTheme,
      title: 'Liberação Picklist',
      home:
          // PickListPage(),
          Builder(
              builder: (context) => LoginPage(
                    accessGranted: () => goHomePage(context),
                    buttonColor: const Color.fromARGB(255, 0, 69, 155),
                    clientId: 'picklist',
                    profileURL: 'https://api.dev.meurh.app/profile',
                    tokenURL:
                        'https://auth.dev.nasajonsistemas.com.br/auth/realms/DEV/protocol/openid-connect/token',
                    loadingURL: '',
                    productLogo: '',
                  )),
    );
  }

  goHomePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const PickListPage()),
    );
  }
}
