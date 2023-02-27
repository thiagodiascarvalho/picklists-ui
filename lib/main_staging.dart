import 'package:flutter/material.dart';

import 'flavors.dart';
import 'src/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Flavors.flavorType = FlavorTypeEnum.stg;

  bootstrap();
}
