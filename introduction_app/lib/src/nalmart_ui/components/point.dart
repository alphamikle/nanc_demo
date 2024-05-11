import 'package:flutter/material.dart';

import '../constants.dart';

class Point extends StatelessWidget {
  const Point({
    this.active = false,
    this.current = false,
    super.key,
  });

  final bool active;
  final bool current;

  @override
  Widget build(BuildContext context) {
    final Widget innerDot = Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: ColorsData.primary,
        borderRadius: BorderRadius.circular(12),
      ),
    );

    if (active) {
      if (current) {
        return Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: ColorsData.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: ColorsData.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: innerDot,
              ),
            ),
          ),
        );
      }
      return SizedBox(
        height: 20,
        child: Center(
          child: innerDot,
        ),
      );
    }
    return SizedBox(
      height: 20,
      child: Center(
        child: Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: ColorsData.quaternaryDarken,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
