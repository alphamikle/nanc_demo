import 'package:flutter/material.dart';
import 'package:nui/nui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nui App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Nui Demo App'),
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
        child: NuiStackWidget(
          renderers: const [],
          imageErrorBuilder: null,
          imageFrameBuilder: null,
          imageLoadingBuilder: null,
          binary: null,
          nodes: null,
          xmlContent: '''
<center>
  <column mainAxisSize="min">
    <text size="18" align="center">
      You have pushed the button\nthis many times:
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
