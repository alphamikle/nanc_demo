import 'package:flutter/material.dart';

import '../../../../service/constants.dart';

class MiddleBody extends StatelessWidget {
  const MiddleBody({
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
        fontSize: 14,
        color: color ?? ColorsData.textBasic,
        fontFamily: font ?? mainFont,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
