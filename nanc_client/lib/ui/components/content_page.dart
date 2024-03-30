import 'dart:typed_data';

import 'package:additions/additions.dart';
import 'package:flutter/material.dart';
import 'package:nui/nui.dart';
import 'package:nanc_tools/nanc_tools.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({
    required this.pageData,
    required this.content,
    required this.nodes,
    required this.binary,
    required this.renderers,
    super.key,
  }) : assert(content != null || nodes != null || binary != null);

  final Json pageData;
  final String? content;
  final List<TagNode>? nodes;
  final Uint8List? binary;
  final List<TagRenderer> renderers;

  @override
  Widget build(BuildContext context) {
    return NuiListWidget(
      xmlContent: content,
      nodes: nodes,
      binary: binary,
      pageData: pageData,
      renderers: renderers,
      imageLoadingBuilder: imageLoadingBuilder,
      imageErrorBuilder: imageErrorBuilder,
      imageFrameBuilder: imageFrameBuilder,
    );
  }
}
