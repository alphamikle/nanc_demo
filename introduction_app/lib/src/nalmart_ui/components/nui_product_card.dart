import 'package:flutter/material.dart';
import 'package:nui/nui.dart';
import 'package:nui_svg_renderer/nui_svg_renderer.dart';

final List<TagNode> _nodes = TagsConverter.fromXml('''
<template id="smallBody">
  <show ifTrue="{{ template.color }}">
    <text text="{{ template.text }}" size="12" color="{{ template.color }}">
      <prop:textStyle font="DM Sans"/>
    </text>
  </show>
  <show ifFalse="{{ template.color }}" nullAsFalse="true">
    <text text="{{ template.text }}" size="12" color="#FF999999">
      <prop:textStyle font="DM Sans"/>
    </text>
  </show>
</template>
<template id="middleBody">
  <text text="{{ template.text }}" size="14" color="#FF000000" maxLines="2" overflow="ellipsis">
    <prop:textStyle font="DM Sans"/>
  </text>
</template>
<template id="roundButton">
  <stack>
    <container>
      <prop:decoration color="{{ template.color }}">
        <prop:borderRadius all="30"/>
      </prop:decoration>

      <padding left="6" top="6" right="6" bottom="6">
        <row mainAxisSize="min">
          <show ifTrue="{{ template.prefix }}">
            <padding left="2" right="4">
              <sizedBox size="20">
                <center>
                  <svg ref="{{ template.prefix }}"/>
                </center>
              </sizedBox>
            </padding>
          </show>
          <show ifFalse="{{ template.prefix }}" nullAsFalse="true">
            <sizedBox width="6"/>
          </show>
          <text text="{{ template.text }}" size="14">
            <prop:textStyle font="DM Sans" color="{{ template.textColor }}" weight="w600"/>
          </text>
          <show ifTrue="{{ template.suffix }}">
            <padding left="6" right="6">
              <sizedBox size="10">
                <svg ref="{{ template.suffix }}"/>
              </sizedBox>
            </padding>
          </show>
          <show ifFalse="{{ template.suffix }}" nullAsFalse="true">
            <sizedBox width="6"/>
          </show>
        </row>
      </padding>
    </container>
    <show ifTrue="{{ template.onPressed }}">
      <positioned all="0">
        <material type="transparency">
          <prop:borderRadius all="30"/>
          <inkWell onPressed="{{ template.onPressed }}">
            <prop:borderRadius all="30"/>
          </inkWell>
        </material>
      </positioned>
    </show>
  </stack>
</template>

<container>
  <prop:decoration>
    <prop:border color="#FFEEEEEE" width="1.6"/>
    <prop:borderRadius all="8"/>
  </prop:decoration>
  <column crossAxisAlignment="start">
    <expanded>
      <center>
        <padding top="4" bottom="4">
          <image ref="{{ page.image }}"/>
        </padding>
      </center>
    </expanded>
    <expanded>
      <column crossAxisAlignment="start">
        <padding left="8" right="8" bottom="8">
          <column crossAxisAlignment="start">
            <component id="smallBody" text="{{ page.subtitle }}"/>
            <component id="middleBody" text="{{ page.title }}"/>
            <sizedBox height="8"/>
            <richText>
              <textSpan text="{{ page.price }}">
                <prop:textStyle color="#FF000000" size="14"/>
              </textSpan>
              <textSpan text="  {{ page.pricePerUnit }}">
                <prop:textStyle color="#FFDCDCDC" size="14"/>
              </textSpan>
            </richText>
          </column>
        </padding>
        <container height="1.6" width="500" color="#FFEEEEEE"/>
        <expanded>
          <center>
            <padding left="8" right="8">
              <row>
                <show ifTrue="{{ page.inStock }}">
                  <component id="smallBody" text="In stock" color="#FF000000"/>
                </show>
                <show ifFalse="{{ page.inStock }}" nullAsFalse="true">
                  <component id="smallBody" text="Out of stock" color="#FF000000"/>
                </show>
                <padding left="8" right="8">
                  <container width="1" height="14" color="#FF000000"/>
                </padding>
                <sizedBox size="20">
                  <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/location_dark.svg"/>
                </sizedBox>
                <sizedBox width="2"/>
                <component id="smallBody" text="S23" color="#FF000000"/>
              </row>
            </padding>
          </center>
        </expanded>
      </column>
    </expanded>
  </column>
</container>
<positioned all="0">
  <material type="transparency">
    <prop:borderRadius all="8"/>
    <inkWell onPressed="{{ page.onPressed }}" splashColor="{{ page.splashColor }}" highlightColor="#00FFFFFF">
      <prop:borderRadius all="8"/>
      <container color="#00FFFFFF"/>
    </inkWell>
  </material>
</positioned>
<positioned top="8" right="8">
  <component id="roundButton" text="Add" color="#FF0B59D5" textColor="#FFFFFFFF"
             prefix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/plus.svg" onPressed="addToCart"/>
</positioned>
''');

class NuiProductCard extends StatelessWidget {
  const NuiProductCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.pricePerUnit,
    this.inStock = false,
    this.splashColor,
    super.key,
  });

  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String pricePerUnit;

  final bool inStock;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return NuiStackWidget.nodes(
      nodes: _nodes,
      renderers: [
        svgRenderer(),
      ],
      pageData: {
        'image': image,
        'title': title,
        'subtitle': subtitle,
        'price': price,
        'pricePerUnit': pricePerUnit,
        'isStock': inStock,
        'splashColor': splashColor?.value.toRadixString(16).replaceFirst('0x', '#'),
        'onPressed': 'doSomeAction',
      },
    );
  }
}
