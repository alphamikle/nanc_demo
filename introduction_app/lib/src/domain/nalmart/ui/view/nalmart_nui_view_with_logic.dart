import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nui/nui.dart';
import 'package:nui_svg_renderer/nui_svg_renderer.dart';

import '../../logic/data/nalmart_view_with_logic.dart';
import '../../logic/data/page_data.dart';

final List<TagNode> nodes = TagsConverter.fromXml(nalmartLayoutWithLogic);

class NalmartNuiViewWithLogic extends StatelessWidget {
  const NalmartNuiViewWithLogic({
    required this.controller,
    super.key,
  });

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return NuiListWidget.nodes(
      scrollController: controller,
      nodes: nodes,
      renderers: [
        svgRenderer(),
      ],
      pageData: pageContext,
    );
  }
}
