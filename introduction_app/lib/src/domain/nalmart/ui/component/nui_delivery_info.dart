import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui/nui.dart';
import 'package:nui_svg_renderer/nui_svg_renderer.dart';

import '../../../../service/constants.dart';
import '../../../../service/tools.dart';
import '../../logic/data/page_data.dart';
import 'delivery_info.dart';
import 'dot.dart';
import 'left_dot.dart';
import 'line_spacer.dart';
import 'right_dot.dart';
import 'round_button.dart';
import 'small_body.dart';
import 'subtitle.dart';

final List<TagNode> _nodes = TagsConverter.fromXml('''
<template id="subtitle">
  <text text="{{ template.text }}" size="18">
    <prop:textStyle weight="w500" height="1.25" font="DM Sans"/>
  </text>
</template>

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

<template id="point">
  <show ifTrue="{{ template.active }}">
    <show ifTrue="{{ template.current }}">
      <container size="20">
        <prop:decoration color="#FF0B59D5">
          <prop:borderRadius all="20"/>
        </prop:decoration>
        <center>
          <container size="16">
            <prop:decoration color="#FFFFFFFF">
              <prop:borderRadius all="16"/>
            </prop:decoration>
            <center>
              <container size="12">
                <prop:decoration color="#FF0B59D5">
                  <prop:borderRadius all="12"/>
                </prop:decoration>
              </container>
            </center>
          </container>
        </center>
      </container>
    </show>
    <show ifFalse="{{ template.current }}" nullAsFalse="true">
      <sizedBox height="20">
        <center>
          <container size="12">
            <prop:decoration color="#FF0B59D5">
              <prop:borderRadius all="12"/>
            </prop:decoration>
          </container>
        </center>
      </sizedBox>
    </show>
  </show>
  <show ifFalse="{{ template.active }}">
    <sizedBox height="20">
      <center>
        <container size="12">
          <prop:decoration color="#FF696E70">
            <prop:borderRadius all="12"/>
          </prop:decoration>
        </container>
      </center>
    </sizedBox>
  </show>
</template>

<template id="leftDot">
  <stack>
    <positioned left="11" top="10" right="0">
      <component id="line" active="{{ template.active }}"/>
    </positioned>

    <positioned left="0" top="1">
      <component id="point" active="{{ template.active }}"/>
    </positioned>

    <sizedBox height="50">
      <align align="bottomLeft">
        <show ifTrue="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="#FF0B59D5" size="12"/>
          </text>
        </show>
        <show ifFalse="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="#FF696E70" size="12"/>
          </text>
        </show>
      </align>
    </sizedBox>
  </stack>
</template>

<template id="dot">
  <stack>
    <positioned left="0" top="10" right="0">
      <row>
        <expanded>
          <component id="line" active="{{ template.leftActive }}"/>
        </expanded>
        <expanded>
          <component id="line" active="{{ template.rightActive }}"/>
        </expanded>
      </row>
    </positioned>

    <positioned left="0" top="1" right="0">
      <align align="topCenter">
        <component id="point" active="{{ template.active }}" current="{{ template.current }}"/>
      </align>
    </positioned>

    <sizedBox height="50">
      <align align="bottomLeft">
        <show ifTrue="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="#FF0B59D5" size="12"/>
          </text>
        </show>
        <show ifFalse="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="#FF696E70" size="12"/>
          </text>
        </show>
      </align>
    </sizedBox>
  </stack>
</template>

<template id="rightDot">
  <stack>
    <positioned left="0" top="10" right="11">
      <component id="line" active="{{ template.active }}"/>
    </positioned>

    <positioned top="1" right="0">
      <component id="point" active="{{ template.active }}"/>
    </positioned>

    <sizedBox height="50">
      <align align="bottomLeft">
        <show ifTrue="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="#FF0B59D5" size="12"/>
          </text>
        </show>
        <show ifFalse="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="#FF696E70" size="12"/>
          </text>
        </show>
      </align>
    </sizedBox>
  </stack>
</template>

<template id="line">
  <show ifTrue="{{ template.active }}">
    <container height="2" width="100">
      <prop:decoration color="#FF0B59D5"/>
    </container>
  </show>
  <show ifFalse="{{ template.active }}">
    <container height="2" width="100">
      <prop:decoration color="#FF696E70"/>
    </container>
  </show>
</template>

<template id="lineSpacer">
  <sizedBox height="50">
    <stack fix="expand">
      <positioned left="0" top="10" right="0">
        <component id="line" active="{{ template.active }}"/>
      </positioned>
    </stack>
  </sizedBox>
</template>

<padding left="16" top="32" right="16">
  <column mainAxisSize="min" crossAxisAlignment="start">
    <row>
      <column mainAxisSize="min" crossAxisAlignment="start">
        <component id="subtitle" text="Your order is on the way"/>
        <component id="smallBody" text="Arrives today, 3pm – 4pm"/>
      </column>
      <spacer/>
      <component id="roundButton" text="Track" prefix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/location.svg"
                 color="#FF0B59D5" textColor="#FFFFFFFF" onPressed="snackbar: Go to track!"/>
    </row>
    <sizedBox height="24"/>
    <row>
      <component id="leftDot"
                 active="{{ page.placed.is_active }}"
                 current="{{ page.placed.is_current }}"
                 title="Placed"/>
      <expanded>
        <component id="lineSpacer" active="{{ page.preparing.is_active }}"/>
      </expanded>

      <component id="dot"
                 leftActive="{{ page.placed.is_active }}"
                 active="{{ page.preparing.is_active }}"
                 current="{{ page.preparing.is_current }}"
                 rightActive="{{ page.on_the_way.is_active }}"
                 title="Preparing"/>
      <expanded>
        <component id="lineSpacer" active="{{ page.on_the_way.is_active }}"/>
      </expanded>

      <component id="dot"
                 leftActive="{{ page.placed.is_active }}"
                 active="{{ page.on_the_way.is_active }}"
                 current="{{ page.on_the_way.is_current }}"
                 rightActive="{{ page.delivered.is_active }}"
                 title="On the way"/>
      <expanded>
        <component id="lineSpacer" active="{{ page.delivered.is_active }}"/>
      </expanded>

      <component id="rightDot"
                 active="{{ page.delivered.is_active }}"
                 current="{{ page.delivered.is_current }}"
                 title="Delivered"/>
    </row>
  </column>
</padding>
''');

class NuiDeliveryInfo extends StatelessWidget {
  const NuiDeliveryInfo({
    required this.deliveryStatus,
    super.key,
  });

  final DeliveryStatus deliveryStatus;

  @override
  Widget build(BuildContext context) {
    final Json statuses = deliveryStatus.toStatuses();

    return NuiStackWidget.nodes(
      nodes: _nodes,
      renderers: [
        svgRenderer(),
      ],
      pageData: statuses,
    );
  }
}
