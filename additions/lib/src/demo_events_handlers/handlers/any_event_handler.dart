import 'package:analytics/analytics.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';

final EventHandler anyEventHandler = EventHandler(
  test: (BuildContext context, String event) => true,
  handler: (BuildContext context, String event) => logger('Event "$event" catch!'),
);
