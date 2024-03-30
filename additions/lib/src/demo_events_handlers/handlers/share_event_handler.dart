import 'package:nanc_analytics/nanc_analytics.dart';
import 'package:flutter/material.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:share_plus/share_plus.dart';

final RegExp _shareRegExp = RegExp(r'^share: ?(?<content>.*)$');

final EventHandler shareDemoHandler = EventHandler(
  test: (BuildContext context, Event event) => _shareRegExp.hasMatch(event.event),
  handler: (BuildContext context, Event event) {
    final String content = _shareRegExp.firstMatch(event.event)!.namedGroup('content')!;
    Analytics.sendEvent('SNARE_EVENT_HANDLED', data: <String, dynamic>{
      'content': content,
    });
    Share.share(content);
  },
);
