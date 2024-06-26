import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui/nui.dart';

import '../../../components.dart';
import 'carousel_slider_arguments.dart';

TagRenderer carouselSliderRenderer() {
  return TagRenderer(
    icon: IconPack.flu_slide_transition_regular,
    tagType: TagType.widget,
    tag: 'carouselSlider',
    description: TagDescription(
      description: '''
# Carousel slider

A carousel slider widget, support infinite scroll and custom child widget.

> This component is not a part of a "standard library" components of the Nanc. It is just a simplified example of how you can add any custom component with any complexity of the logic and simplicity of adding and using to the Nanc.
''',
      arguments: [
        heightArgument(),
        colorArgument(name: 'dotColor'),
        doubleArgument(name: 'sliderDotGap'),
      ],
      properties: [],
    ),
    example: '''
<template id="card">
  <container>
    <prop:decoration color="#FFFFFF">
      <prop:borderRadius all="10"/>
      <prop:shadow color="#80000000" blurRadius="20" spreadRadius="-10"/>
    </prop:decoration>
    
    <padding left="16" top="20" right="16" bottom="20">
      <column mainAxisSize="min">
        <container size="50">
          <prop:decoration color="#F07178">
            <prop:borderRadius all="50"/>
          </prop:decoration>
        </container>
        <divider height="12"/>
        <text>
          <prop:textStyle font="Josefin Sans" size="25" height="1.5" weight="w600"/>
          CARD #{{ template.number }}
        </text>
        <text>
          <prop:textStyle font="Josefin Sans" size="16" height="1.5" weight="w400"/>
          CO-FOUNDER
        </text>
        <divider height="18"/>
        <text color="#6C6C72">
          <prop:textStyle font="Josefin Sans" size="16" height="1.5" weight="w400"/>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra nunc ante velit vitae. Est tellus vitae, nullam lobortis enim.
        </text>
      </column>
    </padding>
  </container>
</template>


<safeArea>
  <carouselSlider height="330">
    <component id="card" number="1"/>
    <component id="card" number="2"/>
    <component id="card" number="3"/>
    <component id="card" number="4"/>
    <component id="card" number="5"/>
  </carouselSlider>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final ReviewsSliderArguments arguments = ReviewsSliderArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      final List<Widget> children = extractor.children;
      if (children.isEmpty) {
        return null;
      }

      return ReviewsSlider(
        height: arguments.height ?? 250,
        dotColor: arguments.dotColor ?? Colors.white,
        sliderDotGap: arguments.sliderDotGap ?? 0,
        children: children,
      );
    },
  );
}
