import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fonts/fonts.dart';
import 'package:icons/icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:svg_renderer/svg_renderer.dart';

import 'layout.dart';

void main() {
  FontsStorage.registerCustomFonts(
    [
      const CustomFont(font: 'Blazeface'),
      const CustomFont(font: 'Helvetica'),
      const CustomFont(font: 'Helvetica Neue'),
      const CustomFont(font: 'SomeAnotherFont', package: 'another_package'),
    ],
  );

  final Map<String, IconData> customIcons = ioniconsMapping.map(
    (String key, String value) => MapEntry(
      'ionic_${key.replaceAll('-', '_')}',
      IoniconsData(
        int.parse(value),
      ),
    ),
  );

  IconsStorage.registerCustomIcons({
    'cup_collections': CupertinoIcons.collections,
    ...customIcons,
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NUI Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const RootView(),
    );
  }
}

class RootView extends StatefulWidget {
  const RootView({
    super.key,
  });

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final DataStorage dataStorage = DataStorage();

  @override
  Widget build(BuildContext context) {
    return DataStorageProvider(
      dataStorage: dataStorage,
      child: Scaffold(
        body: NuiListWidget(
          renderers: [
            svgRenderer(),
          ],
          xmlContent: rootViewLayout,
          pageData: {},
        ),
      ),
    );
  }
}
