import 'package:flutter/material.dart';

class SimpleGrid extends StatelessWidget {
  const SimpleGrid({
    required this.builder,
    required this.itemCount,
    super.key,
  });

  final NullableIndexedWidgetBuilder builder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: builder,
        itemCount: itemCount,
      ),
    );
  }
}
