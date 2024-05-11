import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nanc_fonts/nanc_fonts.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui/nui.dart';
import 'package:nui_svg_renderer/nui_svg_renderer.dart';

import 'src/nalmart_ui/nalmart_native_short_widget.dart';
import 'src/nalmart_ui/nalmart_native_widget.dart';
import 'src/nalmart_ui/native_grid.dart';
import 'src/nalmart_ui/nui_grid.dart';
import 'test_tools.dart';

const int iterations = 50;

bool get noCacheExtent => false;

const String xmlId = 'Time to handle XML';
const String jsonId = 'Time to handle JSON';
const String protoId = 'Time to handle Protobuf';

Stopwatch stopwatch = Stopwatch();
Completer<int>? uiTimeCompleter;

void visibilityHandler(BuildContext context, Event event) {
  // print('Time to show: ${stopwatch.elapsedMicroseconds} microseconds');
  if (uiTimeCompleter != null) {
    uiTimeCompleter!.complete(stopwatch.elapsedMicroseconds);
    uiTimeCompleter = null;
  }
  stopwatch.stop();
  stopwatch.reset();
}

void main() {
  FontsStorage.registerCustomFonts(
    [
      const CustomFont(font: 'Blazeface'),
      const CustomFont(font: 'Helvetica'),
      const CustomFont(font: 'Helvetica Neue'),
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EventDelegate(
      handlers: [
        EventHandler(
          test: (BuildContext context, Event event) => event.event == 'created',
          handler: visibilityHandler,
        ),
      ],
      child: MaterialApp(
        title: 'Nui App - Performance test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Nui Demo App'),
      ),
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
  Widget? nuiWidget;

  /// All tests were made on the Galaxy S24 Ultra
  /// Average time: 883 microseconds
  /// Median time: 825 microseconds
  /// 95 percentile time: 997 microseconds
  Future<void> runXmlTests() async {
    final String xmlSource = await readFileAsString('nalmart_ui_code.html');

    final Metrics metrics = runExperiments(
      id: xmlId,
      iterations: iterations,
      action: ([_]) => TagsConverter.fromXml(xmlSource),
    );

    printMetrics(xmlId, metrics);
  }

  /// Average time: 393 microseconds
  /// Median time: 373 microseconds
  /// 95 percentile time: 500 microseconds
  Future<void> runJsonTests() async {
    final String jsonSource = await readFileAsString('nalmart_ui_code.json');
    final dynamic parsedJson = jsonDecode(jsonSource);

    final Metrics metrics = runExperiments(
      id: jsonId,
      iterations: iterations,
      action: ([_]) => TagsConverter.fromJson(parsedJson),
    );

    printMetrics(jsonId, metrics);
  }

  /// Average time: 704 microseconds
  /// Median time: 648 microseconds
  /// 95 percentile time: 851 microseconds
  Future<void> runJsonRawTests() async {
    final String jsonSource = await readFileAsString('nalmart_ui_code.json');

    final Metrics metrics = runExperiments(
      id: jsonId,
      iterations: iterations,
      action: ([_]) => TagsConverter.fromJson(jsonDecode(jsonSource)),
    );

    printMetrics(jsonId, metrics);
  }

  /// Average time: 599 microseconds
  /// Median time: 559 microseconds
  /// 95 percentile time: 772 microseconds
  Future<void> runProtobufTests() async {
    final Uint8List protobufSource = await readFileAsBytes('nalmart_ui_code.pb');

    final Metrics metrics = runExperiments(
      id: protoId,
      iterations: iterations,
      action: ([_]) => TagsConverter.fromBinary(protobufSource),
    );

    printMetrics(protoId, metrics);
  }

  Future<void> showUI({required BuildContext context, bool showNativeUi = false, bool short = false, bool long = false}) async {
    assert(short == false || long == false);

    final String xmlSource = await readFileAsString('nalmart_ui_code${short ? '_short' : ''}${long ? '_long' : ''}.html');
    final String rawContextJson = await readFileAsString('nalmart_context_data.json');
    final Json contextJson = castToJson(jsonDecode(rawContextJson));
    final List<TagNode> nodes = TagsConverter.fromXml(xmlSource);

    if (context.mounted) {
      if (showNativeUi) {
        nuiWidget = short
            ? NalmartNativeShortWidget(
                onShow: () => visibilityHandler(context, Event(event: 'created')),
              )
            : NalmartNativeWidget(
                isLong: long,
                noCacheExtent: noCacheExtent,
                onShow: () => visibilityHandler(context, Event(event: 'created')),
              );
      } else {
        nuiWidget = NuiListWidget.nodes(
          cacheExtent: noCacheExtent ? 0 : null,
          nodes: nodes,
          renderers: [
            svgRenderer(),
          ],
          pageData: contextJson,
        );
      }
    }

    setState(() {});
    stopwatch.reset();
    stopwatch.start();

    unawaited(Future<void>.delayed(const Duration(seconds: 30), () => setState(() => nuiWidget = null)));
  }

  Future<Metrics> runUITest<T>({required String id, required WidgetBuilder builder}) async {
    final List<int> timings = [];

    for (int i = 0; i < iterations; i++) {
      print('$id Iteration: ${i + 1} of $iterations');
      uiTimeCompleter = Completer();
      stopwatch.start();
      setState(() {
        nuiWidget = builder(context);
      });
      final int time = await uiTimeCompleter!.future;
      timings.add(time);
      await wait(duration: const Duration(milliseconds: 800));
      setState(() {
        nuiWidget = null;
      });
      await wait(duration: const Duration(milliseconds: 800));
    }

    return calculateMetrics(timings);
  }

  /// ? Full layout:
  /// Nui:
  /// Average time: 77601 microseconds
  /// Median time: 79527 microseconds
  /// 95 percentile time: 86733 microseconds
  ///
  /// Native:
  /// Average time: 34853 microseconds
  /// Median time: 38069 microseconds
  /// 95 percentile time: 43318 microseconds
  ///
  /// ? Short layout:
  /// Nui:
  /// Average time: 41278 microseconds
  /// Median time: 40591 microseconds
  /// 95 percentile time: 48907 microseconds
  ///
  /// Native:
  /// Average time: 21674 microseconds
  /// Median time: 22146 microseconds
  /// 95 percentile time: 27990 microseconds
  ///
  /// ? Full layout, cacheExtent = 0:
  /// Nui:
  /// Average time: 54829 microseconds
  /// Median time: 54490 microseconds
  /// 95 percentile time: 63474 microseconds
  ///
  /// Native:
  /// Average time: 21518 microseconds
  /// Median time: 22014 microseconds
  /// 95 percentile time: 27241 microseconds
  ///
  /// ? Long layout
  /// Nui:
  /// Average time: 105502 microseconds
  /// Median time: 105821 microseconds
  /// 95 percentile time: 111697 microseconds
  ///
  /// Native:
  /// Average time: 34484 microseconds
  /// Median time: 33841 microseconds
  /// 95 percentile time: 43760 microseconds
  Future<void> runUITests({bool short = false, bool long = false}) async {
    assert(short == false || long == false);

    final String xmlSource = await readFileAsString('nalmart_ui_code${short ? '_short' : ''}${long ? '_long' : ''}.html');
    final String rawContextJson = await readFileAsString('nalmart_context_data.json');
    final Json contextJson = castToJson(jsonDecode(rawContextJson));
    final List<TagNode> nodes = TagsConverter.fromXml(xmlSource);

    final Metrics nuiMetrics = await runUITest<void>(
      id: 'Nui',
      builder: (BuildContext context) => NuiListWidget.nodes(
        cacheExtent: noCacheExtent ? 0 : null,
        nodes: nodes,
        renderers: [
          svgRenderer(),
        ],
        pageData: contextJson,
      ),
    );

    final Metrics nativeMetrics = await runUITest<void>(
      id: 'Native',
      builder: (BuildContext context) => short
          ? NalmartNativeShortWidget(
              onShow: () => visibilityHandler(context, Event(event: 'created')),
            )
          : NalmartNativeWidget(
              isLong: long,
              noCacheExtent: noCacheExtent,
              onShow: () => visibilityHandler(context, Event(event: 'created')),
            ),
    );

    printMetrics('Nui', nuiMetrics);
    printMetrics('Native', nativeMetrics);
  }

  /// ? Nui:
  /// All:
  /// Average time: 29366 microseconds
  /// Median time: 29353 microseconds
  /// 95 percentile time: 35388 microseconds
  ///
  /// -1:
  /// Average time: 27867 microseconds
  /// Median time: 28057 microseconds
  /// 95 percentile time: 35731 microseconds
  ///
  /// -2:
  /// Average time: 26119 microseconds
  /// Median time: 26843 microseconds
  /// 95 percentile time: 32489 microseconds
  ///
  /// -3:
  /// Average time: 25473 microseconds
  /// Median time: 26722 microseconds
  /// 95 percentile time: 28563 microseconds
  ///
  /// -4:
  /// Average time: 23651 microseconds
  /// Median time: 24195 microseconds
  /// 95 percentile time: 29623 microseconds
  ///
  /// -5:
  /// Average time: 22973 microseconds
  /// Median time: 22336 microseconds
  /// 95 percentile time: 30151 microseconds
  ///
  /// -6:
  /// Average time: 22745 microseconds
  /// Median time: 21373 microseconds
  /// 95 percentile time: 30100 microseconds
  ///
  /// ? Native:
  /// Average time: 19553 microseconds
  /// Median time: 19915 microseconds
  /// 95 percentile time: 24993 microseconds
  Future<void> runUITestsAlt() async {
    final Set<int> nativeIndexes = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    for (int i = 11; i < 20; i++) {
      nativeIndexes.add(i);
      final Metrics nuiMetrics = await runUITest<void>(
        id: 'Nui',
        builder: (BuildContext context) => NuiGrid(
          onShow: () => visibilityHandler(
            context,
            Event(event: 'created'),
          ),
        ),
      );

      setState(() {
        nuiWidget = null;
      });

      printMetrics('Nui with ${i + 1} first native elements', nuiMetrics);
    }

    await wait(duration: const Duration(seconds: 1));

    final Metrics nativeMetrics = await runUITest<void>(
      id: 'Native',
      builder: (BuildContext context) => NativeGrid(
        onShow: () => visibilityHandler(
          context,
          Event(event: 'created'),
        ),
      ),
    );

    setState(() {
      nuiWidget = null;
    });

    printMetrics('Native', nativeMetrics);
  }

  @override
  Widget build(BuildContext context) {
    if (nuiWidget != null) {
      return DataStorageProvider(
        dataStorage: DataStorage(),
        child: Scaffold(
          body: nuiWidget,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: runXmlTests,
              child: const Text('Run XML Tests'),
            ),
            TextButton(
              onPressed: runJsonTests,
              child: const Text('Run JSON Tests'),
            ),
            TextButton(
              onPressed: runJsonRawTests,
              child: const Text('Run JSON (raw) Tests'),
            ),
            TextButton(
              onPressed: runProtobufTests,
              child: const Text('Run Protobuf Tests'),
            ),
            TextButton(
              onPressed: () async => showUI(context: context),
              child: const Text('Show Nui'),
            ),
            TextButton(
              onPressed: () async => showUI(context: context, showNativeUi: true),
              child: const Text('Show Native UI'),
            ),
            TextButton(
              onPressed: () async => showUI(context: context, long: true),
              child: const Text('Show Nui (long)'),
            ),
            TextButton(
              onPressed: () async => showUI(context: context, showNativeUi: true, long: true),
              child: const Text('Show Native UI (long)'),
            ),
            TextButton(
              onPressed: () async => runUITests(),
              child: const Text('Run UI Tests'),
            ),
            TextButton(
              onPressed: () async => runUITests(short: true),
              child: const Text('Run UI Tests (short)'),
            ),
            TextButton(
              onPressed: () async => runUITests(long: true),
              child: const Text('Run UI Tests (long)'),
            ),
            TextButton(
              onPressed: () async => runUITestsAlt(),
              child: const Text('Run UI Tests (Alt)'),
            ),
          ],
        ),
      ),
    );
  }
}
