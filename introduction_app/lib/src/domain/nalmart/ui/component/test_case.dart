import 'package:flutter/material.dart';

typedef Case = (String, VoidCallback);

class TestCase extends StatelessWidget {
  const TestCase({
    required this.title,
    required this.onPressed,
    this.wide = true,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    final Widget button = TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(title),
          const Spacer(),
        ],
      ),
    );
    if (wide) {
      return Row(
        children: [
          Expanded(child: button),
        ],
      );
    }
    return button;
  }
}

class TestCases extends StatelessWidget {
  const TestCases({
    required this.cases,
    super.key,
  });

  final List<Case> cases;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...cases.map((Case it) => Expanded(child: TestCase(title: it.$1, onPressed: it.$2, wide: false))),
      ],
    );
  }
}
