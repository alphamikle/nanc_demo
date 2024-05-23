import 'package:flutter/material.dart';

import 'line.dart';

class LineSpacer extends StatelessWidget {
  const LineSpacer({
    this.active = false,
    super.key,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            top: 10,
            right: 0,
            child: Line(
              active: active,
            ),
          ),
        ],
      ),
    );
  }
}
