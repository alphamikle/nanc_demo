import 'package:flutter/material.dart';

import '../constants.dart';
import 'line.dart';
import 'point.dart';

class RightDot extends StatelessWidget {
  const RightDot({
    required this.title,
    this.active = false,
    this.current = false,
    super.key,
  });

  final String title;
  final bool active;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 10,
          right: 11,
          child: Line(
            active: active,
          ),
        ),
        Positioned(
          top: 1,
          right: 0,
          child: Point(
            active: active,
            current: current,
          ),
        ),
        SizedBox(
          height: 50,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: TextStyle(
                color: active ? ColorsData.primary : ColorsData.quaternaryDarken,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
