import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:url_launcher/url_launcher_string.dart';

final RegExp _browserRegExp = RegExp(r'^browser: ?(?<content>.*)$');

final EventHandler browserLinksEventDemoHandler = EventHandler(
  test: (BuildContext context, Event event) => _browserRegExp.hasMatch(event.event),
  handler: (BuildContext context, Event event) async {
    final String content = _browserRegExp.firstMatch(event.event)!.namedGroup('content')!;
    final bool isRealLink = content.startsWith('http');
    if (isRealLink == false) {
      Analytics.sendEvent('BROWSER_LINK_EVENT_NOT_HANDLED', data: <String, dynamic>{
        'content': content,
      });
      throw Exception('"$content" is incorrect link!');
    }
    Analytics.sendEvent('BROWSER_LINK_EVENT_HANDLED', data: <String, dynamic>{
      'content': content,
    });
    await launchUrlString(
      content,
      mode: LaunchMode.externalApplication,
    );
  },
);
