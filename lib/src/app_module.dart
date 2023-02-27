import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_core/ana_core.dart';
import 'package:flutter_global_dependencies/flutter_global_dependencies.dart';
import 'package:nsj_flutter_login/nsj_login.dart';
import 'package:picklist_ui/screens/pickList_page.dart';
import '../flavors.dart';

class AppModule extends Module {
  final loginModule = NsjLoginModule(
      clientId: 'estoque_api',
      authUrl: Flavors.apiUrls.authUrl,
      accessGranted: () => Modular.to.navigate('/home'));
  @override
  List<Module> get imports => [loginModule];

  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => SharedPreferenceLocalStorage()),
        Bind.lazySingleton((i) => AsukaOverlayService()),
        Bind.lazySingleton((i) => DioClientService(Flavors.apiUrls)),
        Bind.lazySingleton((i) => ConnectionService()),
        Bind.singleton((i) => ConnectionStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute('/', to: '/login'),
        ModuleRoute('/login', module: loginModule),
        ChildRoute('/home', child: (_, __) => const PickListPage())
      ];
}
