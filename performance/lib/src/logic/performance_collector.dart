import 'dart:developer';

import 'package:flutter/scheduler.dart';

abstract final class PerformanceCollector {
  static List<FrameTiming> _framesInfo = [];
  static bool _skippedFirstSample = false;
  static bool _isRunning = false;

  static void start() {
    if (_isRunning) {
      log('Performance collector already running');
      return;
    }
    _isRunning = true;
    SchedulerBinding.instance.addTimingsCallback(_timingsCallback);
  }

  static List<FrameTiming> stop() {
    if (_isRunning == false) {
      log('Performance collector is not running');
    }
    SchedulerBinding.instance.removeTimingsCallback(_timingsCallback);
    _isRunning = false;
    _skippedFirstSample = false;
    final List<FrameTiming> response = _framesInfo;
    _framesInfo = [];
    return response;
  }

  static void _timingsCallback(List<FrameTiming> frameTimings) {
    if (!_skippedFirstSample) {
      frameTimings = frameTimings.sublist(1);
      _skippedFirstSample = true;
    }

    _framesInfo.addAll(frameTimings);
  }
}
