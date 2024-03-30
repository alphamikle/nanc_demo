import 'package:flutter/material.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:nanc_tools/nanc_tools.dart';

final EventHandler anyEventHandler = EventHandler(
  test: (BuildContext context, Event event) => true,
  handler: (BuildContext context, Event event) => logInfo('Event "${prettyJson(event.toJson())}" catch!'),
);
