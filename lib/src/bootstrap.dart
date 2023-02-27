import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_core/ana_core.dart';
import 'package:flutter_global_dependencies/flutter_global_dependencies.dart';

import 'app_module.dart';
import 'app_widget.dart';

T tripleResolverCallback<T extends Object>() => Modular.get<T>();

Future<void> bootstrap() async {
  if (!kIsWeb && (!Platform.isLinux && !Platform.isWindows)) {
    await Firebase.initializeApp();

    await CrashlyticsService.initializeFlutterFire();
  }

  TripleObserver.addListener((triple) => log('TripleObserver: ${triple.runtimeType} ${triple.state}'));

  setTripleResolver(tripleResolverCallback);

  setTripleHydratedDelegate(SharedPreferencesHydratedDelegate());

  HiveCoreAdapters.registerAdapters();

  await runZonedGuarded(
    () async => runApp(
      ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
    CrashlyticsService.recordError,
  );
}
