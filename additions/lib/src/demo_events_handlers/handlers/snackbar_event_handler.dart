import 'package:analytics/analytics.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';

final RegExp _snackBarRegExp = RegExp(r'^snackbar: ?(?<content>.*)$');

final EventHandler snackbarDemoHandler = EventHandler(
  test: (BuildContext context, String event) => _snackBarRegExp.hasMatch(event),
  handler: (BuildContext context, String event) {
    final String content = _snackBarRegExp.firstMatch(event)!.namedGroup('content')!;
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
