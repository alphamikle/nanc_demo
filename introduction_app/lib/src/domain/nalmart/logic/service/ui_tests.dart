import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui/nui.dart';
import 'package:nui_svg_renderer/nui_svg_renderer.dart';
import 'package:performance/performance.dart';

import '../../../../service/auto_scroll.dart';
import '../../../../service/test_tools.dart';
import '../../ui/component/native_grid.dart';
import '../../ui/component/nui_grid.dart';
import '../../ui/view/nalmart_hybrid_view_with_logic.dart';
import '../../ui/view/nalmart_native_short_view.dart';
import '../../ui/view/nalmart_native_view.dart';
import '../../ui/view/nalmart_native_view_with_logic.dart';
import '../../ui/view/nalmart_nui_view_with_logic.dart';
import '../bloc/native_bloc.dart';
import 'test_config.dart';

typedef OnWidgetUpdate = void Function(Widget? child);

class UiTests {
  UiTests({
    required this.context,
    required this.onWidgetUpdate,
  });

  final BuildContext context;
  final OnWidgetUpdate onWidgetUpdate;

  List<TagNode>? _defaultSource;
  List<TagNode>? _longSource;
  List<TagNode>? _shortSource;
  Json? _contextJson;

  final ScrollController nativeScrollController = ScrollController();
  final ScrollController hybridScrollController = ScrollController();
  final ScrollController nuiScrollController = ScrollController();

  Future<Json> _getContextJson() async {
    if (_contextJson != null) {
      return _contextJson!;
    }
    final String rawContextJson = await readFileAsString('nalmart_context_data.json');
    _contextJson = castToJson(jsonDecode(rawContextJson));
    return _contextJson!;
  }

  Future<List<TagNode>> _getSource({bool long = false, bool short = false}) async {
    if (long) {
      if (_longSource != null) {
        return _longSource!;
      }
      final String xmlSource = await readFileAsString('nalmart_ui_code_long.html');
      final List<TagNode> nodes = TagsConverter.fromXml(xmlSource);
      _longSource = nodes;
      return nodes;
    } else if (short) {
      if (_shortSource != null) {
        return _shortSource!;
      }
      final String xmlSource = await readFileAsString('nalmart_ui_code_short.html');
      final List<TagNode> nodes = TagsConverter.fromXml(xmlSource);
      _shortSource = nodes;
      return nodes;
    }
    if (_defaultSource != null) {
      return _defaultSource!;
    }
    final String xmlSource = await readFileAsString('nalmart_ui_code.html');
    final List<TagNode> nodes = TagsConverter.fromXml(xmlSource);
    _defaultSource = nodes;
    return nodes;
  }

  Future<Metrics> runUITest<T>({required String id, required WidgetBuilder builder}) async {
    final List<FrameTiming> timings = [];

    for (int i = 0; i < testsIterations; i++) {
      justPrint('$id Iteration: ${i + 1} of $testsIterations');
      PerformanceCollector.start();
      onWidgetUpdate(builder(context));
      await wait(duration: const Duration(milliseconds: 2000));
      final List<FrameTiming> framesInfo = PerformanceCollector.stop();
      timings.addAll(framesInfo);
      onWidgetUpdate(null);
      await wait(duration: const Duration(milliseconds: 1000));
    }

    return calculateMetrics(id, timings.map((FrameTiming it) => it.totalSpan.inMicroseconds).toList());
  }

  Future<Metrics> runNuiInitialRenderingPerformanceTest({bool getName = false}) async {
    const String name = 'Initial rendering performance: Nui';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final Json contextJson = await _getContextJson();
    final List<TagNode> nodes = await _getSource();

    final Metrics metrics = await runUITest<void>(
      id: name,
      builder: (BuildContext context) => NuiListWidget.nodes(
        nodes: nodes,
        renderers: [
          svgRenderer(),
        ],
        pageData: contextJson,
      ),
    );

    return metrics;
  }

  Future<Metrics> runNativeInitialRenderingPerformanceTest({bool getName = false}) async {
    const String name = 'Initial rendering performance: Native';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final Metrics metrics = await runUITest<void>(
      id: name,
      builder: (BuildContext context) => const NalmartNativeView(),
    );

    return metrics;
  }

  Future<Metrics> runNuiNoCacheInitialRenderingPerformanceTest({bool getName = false}) async {
    const String name = 'Initial rendering performance: Nui, No Cache';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final Json contextJson = await _getContextJson();
    final List<TagNode> nodes = await _getSource();

    final Metrics metrics = await runUITest<void>(
      id: name,
      builder: (BuildContext context) => NuiListWidget.nodes(
        cacheExtent: 0,
        nodes: nodes,
        renderers: [
          svgRenderer(),
        ],
        pageData: contextJson,
      ),
    );

    return metrics;
  }

  Future<Metrics> runNativeNoCacheInitialRenderingPerformanceTest({bool getName = false}) async {
    const String name = 'Initial rendering performance: Native, No Cache';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final Metrics metrics = await runUITest<void>(
      id: name,
      builder: (BuildContext context) => const NalmartNativeView(noCacheExtent: true),
    );

    return metrics;
  }

  Future<Metrics> runNuiShortViewInitialRenderingPerformanceTest({bool getName = false}) async {
    const String name = 'Initial rendering performance: Nui, Short View';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final Json contextJson = await _getContextJson();
    final List<TagNode> nodes = await _getSource(short: true);

    final Metrics metrics = await runUITest<void>(
      id: name,
      builder: (BuildContext context) => NuiListWidget.nodes(
        nodes: nodes,
        renderers: [
          svgRenderer(),
        ],
        pageData: contextJson,
      ),
    );

    return metrics;
  }

  Future<Metrics> runNativeShortViewInitialRenderingPerformanceTest({bool getName = false}) async {
    const String name = 'Initial rendering performance: Native, Short View';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final Metrics metrics = await runUITest<void>(
      id: name,
      builder: (BuildContext context) => const NalmartNativeShortWidget(),
    );

    return metrics;
  }

  Future<Metrics> runNuiLargeViewRenderingPerformanceTest({bool getName = false}) async {
    const String name = 'Initial rendering performance: Nui, Large View';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final Json contextJson = await _getContextJson();
    final List<TagNode> nodes = await _getSource(long: true);

    final Metrics metrics = await runUITest<void>(
      id: name,
      builder: (BuildContext context) => NuiListWidget.nodes(
        nodes: nodes,
        renderers: [
          svgRenderer(),
        ],
        pageData: contextJson,
      ),
    );

    return metrics;
  }

  Future<Metrics> runNativeLargeViewRenderingPerformanceTest({bool getName = false}) async {
    const String name = 'Initial rendering performance: Native, Large View';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final Metrics metrics = await runUITest<void>(
      id: name,
      builder: (BuildContext context) => const NalmartNativeView(isLong: true),
    );

    return metrics;
  }

  Future<Metrics> runNuiAltPerformanceTest({int nativeCount = 0, bool getName = false}) async {
    const String name = 'Initial rendering performance: Nui, Cards';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final Set<int> nativeIndexes = {};

    for (int i = 0; i < nativeCount; i++) {
      nativeIndexes.add(i);
    }

    final Metrics metrics = await runUITest<void>(
      id: name,
      builder: (BuildContext context) => NuiGrid(nativeIndexes: nativeIndexes),
    );

    return metrics;
  }

  Future<Metrics> runNativeAltPerformanceTest({bool getName = false}) async {
    const String name = 'Initial rendering performance: Native, Cards';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final Metrics metrics = await runUITest<void>(
      id: name,
      builder: (BuildContext context) => const NativeGrid(),
    );

    return metrics;
  }

  Future<Metrics> runNativeBlocPerformanceTest({bool getName = false}) async {
    const String name = 'Native UI + Bloc';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final NativeBloc nativeBloc = context.read();

    unawaited(nativeBloc.startUpdates());
    PerformanceCollector.start();
    onWidgetUpdate(NalmartNativeViewWithLogic(controller: nativeScrollController));
    await autoScroll(nativeScrollController, realTimeTestDuration);
    final List<FrameTiming> timings = PerformanceCollector.stop();
    onWidgetUpdate(null);

    return calculateMetrics(name, timings.map((FrameTiming it) => it.totalSpan.inMicroseconds).toList());
  }

  Future<Metrics> runHybridBlocPerformanceTest({bool getName = false}) async {
    const String name = 'Hybrid UI + Bloc';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final NativeBloc nativeBloc = context.read();

    unawaited(nativeBloc.startUpdates());
    PerformanceCollector.start();
    onWidgetUpdate(NalmartHybridViewWithLogic(controller: hybridScrollController));
    await autoScroll(hybridScrollController, realTimeTestDuration);
    final List<FrameTiming> timings = PerformanceCollector.stop();
    onWidgetUpdate(null);

    return calculateMetrics(name, timings.map((FrameTiming it) => it.totalSpan.inMicroseconds).toList());
  }

  Future<Metrics> runNuiBlocPerformanceTest({bool getName = false}) async {
    const String name = 'Nui UI + Bloc';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final NativeBloc nativeBloc = context.read();

    unawaited(nativeBloc.startUpdates());
    PerformanceCollector.start();
    onWidgetUpdate(NalmartNuiViewWithLogic(controller: nuiScrollController));
    await autoScroll(nuiScrollController, realTimeTestDuration);
    final List<FrameTiming> timings = PerformanceCollector.stop();

    onWidgetUpdate(null);

    return calculateMetrics(name, timings.map((FrameTiming it) => it.totalSpan.inMicroseconds).toList());
  }

  Future<Metrics> compareScreens({bool getName = false}) async {
    const String name = 'Screens comparison';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final NativeBloc nativeBloc = context.read();

    await wait(duration: const Duration(milliseconds: 500));

    onWidgetUpdate(NalmartNuiViewWithLogic(controller: nuiScrollController));
    await wait(duration: const Duration(milliseconds: 1000));
    unawaited(nativeBloc.startUpdates());
    await wait(duration: realTimeTestDuration);
    onWidgetUpdate(null);

    await wait(duration: const Duration(seconds: 1));

    onWidgetUpdate(NalmartNativeViewWithLogic(controller: nativeScrollController));
    await wait(duration: const Duration(milliseconds: 1000));
    unawaited(nativeBloc.startUpdates());
    await wait(duration: realTimeTestDuration);
    onWidgetUpdate(null);

    await wait(duration: const Duration(seconds: 1));

    onWidgetUpdate(NalmartHybridViewWithLogic(controller: hybridScrollController));
    await wait(duration: const Duration(milliseconds: 1000));
    unawaited(nativeBloc.startUpdates());
    await wait(duration: realTimeTestDuration);
    onWidgetUpdate(null);

    await wait(duration: const Duration(seconds: 1));

    return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
  }
}
