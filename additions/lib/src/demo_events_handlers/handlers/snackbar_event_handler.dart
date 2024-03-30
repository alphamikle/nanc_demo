import 'package:nanc_analytics/nanc_analytics.dart';
import 'package:flutter/material.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

final RegExp _snackBarRegExp = RegExp(r'^snackbar: ?(?<content>.*)$');

final EventHandler snackbarDemoHandler = EventHandler(
  test: (BuildContext context, Event event) => _snackBarRegExp.hasMatch(event.event),
  handler: (BuildContext context, Event event) {
    final String content = _snackBarRegExp.firstMatch(event.event)!.namedGroup('content')!;
    Analytics.sendEvent('SNACK_BAR_EVENT_HANDLED', data: <String, dynamic>{
      'content': content,
    });
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(content)),
      );
    } catch (error) {
      // DO NOTHING
    }
  },
);
