import 'package:analytics/analytics.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:url_launcher/url_launcher_string.dart';

final RegExp _deeplinkRegExp = RegExp(r'^deeplink: ?(?<content>.*)$');

final EventHandler deeplinkEventDemoHandler = EventHandler(
  test: (BuildContext context, Event event) => _deeplinkRegExp.hasMatch(event.event),
  handler: (BuildContext context, Event event) {
    final String content = _deeplinkRegExp.firstMatch(event.event)!.namedGroup('content')!;
    Analytics.sendEvent('DEEP_LINK_EVENT_HANDLED', data: <String, dynamic>{
      'content': content,
    });
    launchUrlString(content);
  },
);
