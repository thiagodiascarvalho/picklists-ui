import 'package:flutter/material.dart';
import 'package:picklist_ui/screens/picklist_page.dart';
import 'package:nsj_login/nsj_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Liberação Picklist', home: PickListPage()
        // Builder(
        //     builder: (context) => LoginPage(
        //           accessGranted: () => goHomePage(context),
        //           buttonColor: const Color.fromARGB(255, 0, 69, 155),
        //           clientId: 'picklist',
        //           clientSecret: 'MUgdRxE3Fw3gBlsm4i1pE2lbw6gaXDD7',
        //           profileURL: 'https://api.dev.meurh.app/profile',
        //           tokenURL:
        //               'https://auth.dev.nasajonsistemas.com.br/auth/realms/DEV/protocol/openid-connect/token',
        //           loadingURL: '',
        //           productLogo: '',
        //         )),
        );
  }

  // goHomePage(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) => const PickListPage()),
  //   );
  // }
}
