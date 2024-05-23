import 'package:flutter/material.dart';

import '../../../../service/constants.dart';

class SmallBody extends StatelessWidget {
  const SmallBody({
    required this.text,
    this.color,
    this.font,
    super.key,
  });

  final Color? color;
  final String text;
  final String? font;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: color ?? ColorsData.quaternary,
        fontFamily: font,
      ),
    );
  }
}
