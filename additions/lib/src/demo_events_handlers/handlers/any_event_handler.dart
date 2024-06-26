import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui/nui.dart';

final EventHandler anyEventHandler = EventHandler(
  test: (BuildContext context, Event event) => true,
  handler: (BuildContext context, Event event) => logInfo('Event "${prettyJson(event.toJson())}" catch!'),
);
