import 'package:flutter/material.dart';
import 'package:nsj_login/nsj_login.dart';
import 'package:picklist_ui/screens/pickList_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Builder(
          builder: (context) => LoginPage(
                accessGranted: () => goHomePage(context),
                buttonColor: const Color.fromARGB(255, 0, 69, 155),
                clientId: 'picklist',
                clientSecret: 'MUgdRxE3Fw3gBlsm4i1pE2lbw6gaXDD7',
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
