import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nanc/nanc.dart';

import 'domain/cms/cms_app.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await startCmsApp(DataProvider.firebase);
  }, ErrorsCatcher.catchZoneErrors);
}
