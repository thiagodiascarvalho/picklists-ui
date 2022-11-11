import 'package:flutter/material.dart';

import 'package:picklist_ui/screens/pickList_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Liberação Picklist',
      home: PickListPage(),
    );
  }
}
