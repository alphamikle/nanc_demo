import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nui/nui.dart';
import 'package:nui_svg_renderer/nui_svg_renderer.dart';

import '../../../../service/constants.dart';
import '../../logic/data/page_data.dart';
import 'small_body.dart';
import 'subtitle.dart';

final List<TagNode> _nodes = TagsConverter.fromXml('''
<padding top="12" bottom="12">
  <row mainAxisSize="min">
    <show ifFalse="{{ page.noPrefix }}">
      <sizedBox width="16"/>
    </show>
    <aspectRatio ratio="1.3">
      <container color="#FFFFFFFF">
        <prop:decoration>
          <prop:borderRadius all="8"/>
          <prop:shadow color="#0F000000" blurRadius="8" offsetY="4"/>
        </prop:decoration>

        <column crossAxisAlignment="start">
          <expanded>
            <clipRRect topLeft="8" topRight="8">
              <image ref="{{ page.image }}" fit="cover"/>
            </clipRRect>
          </expanded>
          <padding all="8">
            <row>
              <sizedBox width="8"/>
              <column crossAxisAlignment="start">
                <text text="{{ page.title }}" size="18">
                  <prop:textStyle weight="w500" height="1.25" font="DM Sans"/>
                </text>
                <text text="{{ page.subtitle }}" size="12" color="#FF999999">
                  <prop:textStyle font="DM Sans"/>
                </text>
              </column>
              <spacer/>
              <padding top="8" right="8">
                <sizedBox size="24">
                  <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/circle_chevron_right.svg"/>
                </sizedBox>
              </padding>
            </row>
          </padding>
        </column>
      </container>
    </aspectRatio>
    <sizedBox width="16"/>
  </row>
</padding>
''');

class NuiAdCard extends StatelessWidget {
  const NuiAdCard({
    this.noPrefix = false,
    this.title,
    this.subtitle,
    this.image,
    super.key,
  });

  final bool noPrefix;
  final String? image;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return NuiStackWidget.nodes(
      fit: StackFit.loose,
      nodes: _nodes,
      renderers: [
        svgRenderer(),
      ],
      pageData: {
        'noPrefix': noPrefix,
        'image': image,
        'title': title,
        'subtitle': subtitle,
      },
    );
  }
}
