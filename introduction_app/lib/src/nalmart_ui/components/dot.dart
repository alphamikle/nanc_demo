import 'package:flutter/material.dart';

import '../constants.dart';
import 'line.dart';
import 'point.dart';

class Dot extends StatelessWidget {
  const Dot({
    required this.title,
    this.leftActive = false,
    this.rightActive = false,
    this.active = false,
    this.current = false,
    super.key,
  });

  final String title;
  final bool leftActive;
  final bool rightActive;
  final bool active;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 10,
          right: 0,
          child: Row(
            children: [
              Expanded(
                child: Line(
                  active: leftActive,
                ),
              ),
              Expanded(
                child: Line(
                  active: rightActive,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 1,
          right: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Point(
              active: active,
              current: current,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: active ? ColorsData.primary : ColorsData.quaternaryDarken,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
