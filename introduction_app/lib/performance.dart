import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:nanc_fonts/nanc_fonts.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui/nui.dart';
import 'package:nui_svg_renderer/nui_svg_renderer.dart';

import 'src/domain/nalmart/logic/bloc/native_bloc.dart';
import 'src/domain/nalmart/logic/data/page_data.dart';
import 'src/domain/nalmart/logic/service/serialization_tests.dart';
import 'src/domain/nalmart/logic/service/test_config.dart';
import 'src/domain/nalmart/logic/service/ui_tests.dart';
import 'src/domain/nalmart/ui/component/header_text.dart';
import 'src/domain/nalmart/ui/component/test_case.dart';
import 'src/domain/nalmart/ui/view/nalmart_native_short_view.dart';
import 'src/domain/nalmart/ui/view/nalmart_native_view.dart';
import 'src/service/test_tools.dart';
import 'src/service/tools.dart';

void main() {
  FontsStorage.registerCustomFonts(
    [
      const CustomFont(font: 'Blazeface'),
      const CustomFont(font: 'Helvetica'),
      const CustomFont(font: 'Helvetica Neue'),
    ],
  );
  final DataStorage dataStorage = DataStorage(
    data: {
      'ads': [...ads],
      'order': castToJson(deepClone(pageContext.find<Json>('order'))),
    },
  );

  runApp(
    DataStorageProvider(
      dataStorage: dataStorage,
      child: BlocProvider<NativeBloc>(
        create: (BuildContext context) => NativeBloc(dataStorage: dataStorage),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nui App - Performance test',
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
  late final SerializationTests serializationTests = SerializationTests();
  late final UiTests uiTests = UiTests(context: context, onWidgetUpdate: onTestViewCreated);

  void onTestViewCreated(Widget? child) {
    final NavigatorState navigator = context.navigator;
    if (child == null) {
      navigator.pop();
    } else {
      unawaited(
        navigator.push(
          CupertinoPageRoute<void>(
            builder: (BuildContext context) => Scaffold(body: child),
          ),
        ),
      );
    }
  }

  Future<void> showUI({required BuildContext context, bool showNativeUi = false, bool short = false, bool long = false}) async {
    assert(short == false || long == false);

    final String xmlSource = await readFileAsString('nalmart_ui_code${short ? '_short' : ''}${long ? '_long' : ''}.html');
    final String rawContextJson = await readFileAsString('nalmart_context_data.json');
    final Json contextJson = castToJson(jsonDecode(rawContextJson));
    final List<TagNode> nodes = TagsConverter.fromXml(xmlSource);

    if (context.mounted) {
      if (showNativeUi) {
        onTestViewCreated(short ? const NalmartNativeShortWidget() : NalmartNativeView(isLong: long));
      } else {
        onTestViewCreated(
          NuiListWidget.nodes(
            nodes: nodes,
            renderers: [
              svgRenderer(),
            ],
            pageData: contextJson,
          ),
        );
      }
    }

    setState(() {});

    unawaited(Future<void>.delayed(realTimeTestDuration, () => onTestViewCreated(null)));
  }

  Future<void> runAllTestCases() async {
    final (String, String) parsingMetrics = await runTestActions(context, [
      serializationTests.runXmlTests,
      serializationTests.runJsonTests,
      serializationTests.runJsonRawTests,
      serializationTests.runProtobufTests,
    ]);

    final (String, String) initialRenderingMetrics = await runTestActions(context, [
      uiTests.runNuiInitialRenderingPerformanceTest,
      uiTests.runNativeInitialRenderingPerformanceTest,
      uiTests.runNuiNoCacheInitialRenderingPerformanceTest,
      uiTests.runNativeNoCacheInitialRenderingPerformanceTest,
      uiTests.runNuiShortViewInitialRenderingPerformanceTest,
      uiTests.runNativeShortViewInitialRenderingPerformanceTest,
      uiTests.runNuiLargeViewRenderingPerformanceTest,
      uiTests.runNativeLargeViewRenderingPerformanceTest,
      uiTests.runNuiAltPerformanceTest,
      uiTests.runNativeAltPerformanceTest,
    ]);

    final (String, String) changingUiRenderingMetrics = await runTestActions(context, [
      uiTests.runNativeBlocPerformanceTest,
      uiTests.runHybridBlocPerformanceTest,
      uiTests.runNuiBlocPerformanceTest,
    ]);

    copy([
      parsingMetrics.$1,
      initialRenderingMetrics.$1,
      changingUiRenderingMetrics.$1,
      '\n\n\n',
      parsingMetrics.$2,
      initialRenderingMetrics.$2,
      changingUiRenderingMetrics.$2,
    ].join('\n\n\n'));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: context.navigator.canPop(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: ListView(
            children: [
              const HeaderText(text: 'All test cases'),
              TestCase(title: 'Run all test cases', onPressed: runAllTestCases),
              const HeaderText(text: 'Serialization'),
              TestCase(title: 'XML', onPressed: serializationTests.runXmlTests),
              TestCase(title: 'JSON', onPressed: serializationTests.runJsonTests),
              TestCase(title: 'RAW JSON', onPressed: serializationTests.runJsonRawTests),
              TestCase(title: 'Protobuf', onPressed: serializationTests.runProtobufTests),
              const Divider(),
              const HeaderText(text: 'Demonstration'),
              TestCase(title: 'Screens comparison', onPressed: uiTests.compareScreens),
              TestCases(
                cases: [
                  ('Nui View', () async => showUI(context: context)),
                  ('Native View', () async => showUI(context: context, showNativeUi: true)),
                ],
              ),
              TestCases(
                cases: [
                  ('Long Nui View', () async => showUI(context: context, long: true)),
                  ('Long Native View', () async => showUI(context: context, showNativeUi: true, long: true)),
                ],
              ),
              const Divider(),
              const HeaderText(text: 'Simple UI tests'),
              TestCases(
                cases: [
                  ('Default render Nui', uiTests.runNuiInitialRenderingPerformanceTest),
                  ('Default render Native', uiTests.runNativeInitialRenderingPerformanceTest),
                ],
              ),
              TestCases(
                cases: [
                  ('No cache render Nui', uiTests.runNuiNoCacheInitialRenderingPerformanceTest),
                  ('No cache render Native', uiTests.runNativeNoCacheInitialRenderingPerformanceTest),
                ],
              ),
              TestCases(
                cases: [
                  ('Short render Nui', uiTests.runNuiShortViewInitialRenderingPerformanceTest),
                  ('Short render Native', uiTests.runNativeShortViewInitialRenderingPerformanceTest),
                ],
              ),
              TestCases(
                cases: [
                  ('Long render Nui', uiTests.runNuiLargeViewRenderingPerformanceTest),
                  ('Long render Native', uiTests.runNativeLargeViewRenderingPerformanceTest),
                ],
              ),
              const Divider(),
              const HeaderText(text: 'Hybrid vs Native Cards'),
              TestCases(
                cases: [
                  ('Hybrid Cards: 0', () async => uiTests.runNuiAltPerformanceTest()),
                  ('Hybrid Cards: 1', () async => uiTests.runNuiAltPerformanceTest(nativeCount: 1)),
                ],
              ),
              TestCases(
                cases: [
                  ('Hybrid Cards: 2', () async => uiTests.runNuiAltPerformanceTest(nativeCount: 2)),
                  ('Hybrid Cards: 3', () async => uiTests.runNuiAltPerformanceTest(nativeCount: 3)),
                ],
              ),
              TestCases(
                cases: [
                  ('Hybrid Cards: 4', () async => uiTests.runNuiAltPerformanceTest(nativeCount: 4)),
                  ('Hybrid Cards: 5', () async => uiTests.runNuiAltPerformanceTest(nativeCount: 5)),
                ],
              ),
              TestCases(
                cases: [
                  ('Hybrid Cards: 6', () async => uiTests.runNuiAltPerformanceTest(nativeCount: 6)),
                  ('Native Cards', () async => uiTests.runNativeAltPerformanceTest()),
                ],
              ),
              const Divider(),
              const HeaderText(text: 'Bloc UI tests'),
              TestCase(title: 'Bloc Tests: Native', onPressed: uiTests.runNativeBlocPerformanceTest),
              TestCase(title: 'Bloc Tests: Hybrid', onPressed: uiTests.runHybridBlocPerformanceTest),
              TestCase(title: 'Bloc Tests: Nui', onPressed: uiTests.runNuiBlocPerformanceTest),
            ],
          ),
        ),
      ),
    );
  }
}
