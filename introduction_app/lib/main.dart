import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fonts/fonts.dart';
import 'package:icons/icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: NuiListWidget(
          renderers: const [],
          imageErrorBuilder: null,
          imageFrameBuilder: null,
          imageLoadingBuilder: null,
          xmlContent: '''
<center>
  <column mainAxisSize="min">
    <text size="18">
      You have pushed the button this many times:
    </text>
    <text size="32">
      {{ page.counter }}
    </text>
  </column>
</center>
''',
          pageData: {
            'counter': _counter,
          },
          sliverChecker: null,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
