import 'package:flutter/material.dart';

import '../../../../service/constants.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({
    required this.text,
    this.font = mainFont,
    super.key,
  });

  final String text;
  final String font;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 1.25,
        fontFamily: font,
      ),
    );
  }
}
