import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:flutter/material.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:tools/tools.dart';

final EventHandler anyEventHandler = EventHandler(
  test: (BuildContext context, Event event) => true,
  handler: (BuildContext context, Event event) => logInfo('Event "${prettyJson(event.toJson())}" catch!'),
);
