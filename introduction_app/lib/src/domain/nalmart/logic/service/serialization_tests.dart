import 'dart:convert';
import 'dart:typed_data';

import 'package:nui/nui.dart';

import '../../../../service/test_tools.dart';
import 'test_config.dart';

class SerializationTests {
  Future<Metrics> runXmlTests({bool getName = false}) async {
    const String name = 'Xml parsing';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final String xmlSource = await readFileAsString('nalmart_ui_code.html');

    final Metrics metrics = runExperiments(
      id: name,
      iterations: testsIterations,
      action: ([_]) => TagsConverter.fromXml(xmlSource),
    );

    return metrics;
  }

  Future<Metrics> runJsonTests({bool getName = false}) async {
    const String name = 'Json as Map<String, dynamic> parsing';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final String jsonSource = await readFileAsString('nalmart_ui_code.json');
    final dynamic parsedJson = jsonDecode(jsonSource);

    final Metrics metrics = runExperiments(
      id: name,
      iterations: testsIterations,
      action: ([_]) => TagsConverter.fromJson(parsedJson),
    );

    return metrics;
  }

  Future<Metrics> runJsonRawTests({bool getName = false}) async {
    const String name = 'Json as raw string parsing';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final String jsonSource = await readFileAsString('nalmart_ui_code.json');

    final Metrics metrics = runExperiments(
      id: name,
      iterations: testsIterations,
      action: ([_]) => TagsConverter.fromJson(jsonDecode(jsonSource)),
    );

    return metrics;
  }

  Future<Metrics> runProtobufTests({bool getName = false}) async {
    const String name = 'Protobuf parsing';

    if (getName) {
      return (title: name, avg: 0, med: 0, p90: 0, p99: 0, all: <int>[]);
    }

    final Uint8List protobufSource = await readFileAsBytes('nalmart_ui_code.pb');

    final Metrics metrics = runExperiments(
      id: name,
      iterations: testsIterations,
      action: ([_]) => TagsConverter.fromBinary(protobufSource),
    );

    return metrics;
  }
}
