import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nanc_fonts/nanc_fonts.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui/nui.dart';
import 'package:nui_svg_renderer/nui_svg_renderer.dart';

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

  /*
  Originally, there are a map of strings, but String-value is an encoded character number from the icon font

  const ioniconsMapping = {
    "accessibility-outline": "0xea01",
    "accessibility-sharp": "0xea02",
    "accessibility": "0xea03",
    ...
  };
   */
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
          nodes: null,
          binary: null,
          pageData: const {},
        ),
      ),
    );
  }
}
