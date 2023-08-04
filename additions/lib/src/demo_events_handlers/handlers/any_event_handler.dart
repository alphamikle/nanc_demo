import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

final EventHandler anyEventHandler = EventHandler(
  test: (BuildContext context, String event) => true,
  handler: (BuildContext context, String event) => logInfo('Event "$event" catch!'),
);
