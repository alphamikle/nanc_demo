import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:nanc_tools/nanc_tools.dart';

Future<void> autoScroll(ScrollController controller, Duration duration, {bool static = false}) async {
  while (controller.hasClients == false) {
    await wait(duration: const Duration(milliseconds: 100));
  }

  final Random random = Random();
  final DateTime initialTime = DateTime.now();
  final Duration diff = DateTime.now().difference(initialTime);
  final DateTime endTime = DateTime.now().add(diff).add(duration);
  bool scrollToEnd = true;

  while (DateTime.now().isBefore(endTime)) {
    final double endPosition = controller.position.maxScrollExtent;
    final double startPosition = controller.position.minScrollExtent;
    final double randomDuration = static ? 400 : random.nextInt(300) + 200;
    final double randomDistance = static ? 300 : random.nextDouble() * 300 + 200;

    if (scrollToEnd) {
      await controller.animateTo(
        min(controller.position.pixels + randomDistance, endPosition),
        duration: Duration(milliseconds: randomDuration.toInt()),
        curve: Curves.easeInOut,
      );

      if (controller.position.pixels >= endPosition) {
        scrollToEnd = false;
      }
    } else {
      await controller.animateTo(
        max(controller.position.pixels - randomDistance, startPosition),
        duration: Duration(milliseconds: randomDuration.toInt()),
        curve: Curves.easeInOut,
      );

      if (controller.position.pixels <= startPosition) {
        scrollToEnd = true;
      }
    }

    await wait(duration: Duration(milliseconds: static ? 400 : random.nextInt(300) + 300));
  }
}
