import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Text(text, style: context.theme.textTheme.headlineSmall),
    );
  }
}
