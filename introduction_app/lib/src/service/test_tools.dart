import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nanc_tools/nanc_tools.dart';

import 'tools.dart';

typedef Microseconds = int;
typedef AvgTimeMs = Microseconds;
typedef Percentile90TimeMs = Microseconds;
typedef Percentile99TimeMs = Microseconds;
typedef MedianTimeMs = Microseconds;
typedef Metrics = ({String title, AvgTimeMs avg, MedianTimeMs med, Percentile90TimeMs p90, Percentile99TimeMs p99, List<int> all});
typedef Action<T> = void Function([T? preActionResult]);
typedef PreAction<T> = FutureOr<T> Function();
typedef TestAction = Future<Metrics> Function({bool getName});

Future<String> readFileAsString(String fileName) async {
  return rootBundle.loadString('assets/data/$fileName');
}

Future<Uint8List> readFileAsBytes(String fileName) async {
  final ByteData data = await rootBundle.load('assets/data/$fileName');
  return Uint8List.sublistView(data);
}

Metrics calculateMetrics(String title, List<Microseconds> timeTable) {
  timeTable.sort();
  final int avg = timeTable.isEmpty ? 0 : timeTable.fold(0, (sum, it) => sum + it) ~/ timeTable.length;
  final int median = timeTable.median.toInt();
  final int p90 = timeTable.percentile(90).toInt();
  final int p99 = timeTable.percentile(99).toInt();

  timeTable.sort((Microseconds a, Microseconds b) => b.compareTo(a));

  return (
    title: title,
    avg: avg,
    med: median,
    p90: p90,
    p99: p99,
    all: timeTable,
  );
}

Metrics runExperiments<T>({
  required String id,
  required int iterations,
  required Action<T> action,
}) {
  final List<Microseconds> timings = [];
  for (int i = 0; i < iterations; i++) {
    Bench.startSilent(id);
    action();
    timings.add(Bench.endRaw(id, compensate: true));
  }
  return calculateMetrics(id, timings);
}

Future<Metrics> runAsyncExperiments<T>({
  required String id,
  required int iterations,
  required Action<T> action,
  PreAction<T>? preAction,
  Duration? delay,
}) async {
  final List<Microseconds> timings = [];
  for (int i = 0; i < iterations; i++) {
    T? preActionResult;
    if (preAction != null) {
      preActionResult = await preAction();
    }
    Bench.startSilent(id);
    action(preActionResult);
    timings.add(Bench.endRaw(id, compensate: true));
    if (iterations > 1 && delay != null) {
      await wait(duration: delay);
    }
  }
  return calculateMetrics(id, timings);
}

Future<String> printAllMetrics(List<Metrics> metrics, {bool rawData = false}) async {
  if (rawData) {
    final List<List<String>> table = [
      [],
    ];

    /*
        [
          [Title 1, Title 2, Title N],
          [Value 1, null, Value N],
          [Value 1, null, null],
        ],
     */

    final List<Metrics> sortedMetrics = [...metrics];
    sortedMetrics.sort((a, b) => b.all.length.compareTo(a.all.length));

    final Metrics? largestMetrics = sortedMetrics.firstOrNull;

    if (largestMetrics == null) {
      return '';
    } else {
      for (int i = 0; i < metrics.length; i++) {
        for (int k = 0; k < largestMetrics.all.length; k++) {
          if (table.notExist(k + 1)) {
            table.add([]);
          }
          table[k + 1].add('');
        }
      }
    }

    for (final Metrics metric in metrics) {
      table[0].add(metric.title);
    }

    for (int i = 0; i < metrics.length; i++) {
      final Metrics metric = metrics[i];

      for (int k = 0; k < metric.all.length; k++) {
        table[k + 1][i] = '=${metric.all[k]}';
      }
    }

    final String result = table.map((List<String> rows) => rows.join('\t')).join('\n');
    copy(result);
    justPrint(result);
    return result;
  }

  final List<List<String>> table = [
    [
      '',
    ],
    [
      'Average',
    ],
    [
      'Median',
    ],
    [
      'P90',
    ],
    [
      'P99',
    ],
  ];

  for (final Metrics metric in metrics) {
    table[0].add(metric.title);
    table[1].add('=${metric.avg}');
    table[2].add('=${metric.med}');
    table[3].add('=${metric.p90}');
    table[4].add('=${metric.p99}');
  }

  final String result = table.map((List<String> rows) => rows.join('\t')).join('\n');
  copy(result);
  justPrint(result);
  return result;
}

void copy(String value) {
  unawaited(
    Clipboard.setData(
      ClipboardData(text: value),
    ),
  );
}

void justPrint(dynamic value) {
  // ignore: avoid_print
  print(value);
}

extension ExtendedDoubleList on List<num> {
  num get median => percentile(50);

  num percentile(int value) {
    assert(value >= 0 && value <= 100);
    final List<num> sortedList = [...this];
    sortedList.sort();
    final double itemsPerPercent = length / 100;
    int targetIndex = (value * itemsPerPercent).ceil();
    if (targetIndex > length) {
      targetIndex = length;
    }
    return sortedList[targetIndex - 1];
  }
}

Future<(String, String)> runTestActions(BuildContext context, List<TestAction> actions) async {
  final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
  final List<Metrics> metrics = [];
  const Duration delay = Duration(milliseconds: 1200);

  for (final TestAction action in actions) {
    final Metrics justName = await action(getName: true);
    messenger.showSnackBar(
      SnackBar(
        duration: delay - const Duration(milliseconds: 300),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(8),
        content: Text('Running: ${justName.title}'),
      ),
    );
    await wait(duration: delay);
    final Metrics result = await action(getName: false);
    metrics.add(result);
  }

  final String generalMetrics = await printAllMetrics(metrics);
  final String allMetrics = await printAllMetrics(metrics, rawData: true);

  return (generalMetrics, allMetrics);
}
