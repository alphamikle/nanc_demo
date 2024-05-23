import 'package:flutter/material.dart';

import '../../../../service/constants.dart';

class Line extends StatelessWidget {
  const Line({
    this.active = false,
    super.key,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 100,
      decoration: BoxDecoration(
        color: active ? ColorsData.primary : ColorsData.quaternaryDarken,
      ),
    );
  }
}
