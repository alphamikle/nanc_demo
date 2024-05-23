import 'package:flutter/material.dart';

import '../../../../service/constants.dart';
import 'star.dart';

class Rating extends StatelessWidget {
  const Rating({
    required this.rating,
    super.key,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    final List<Widget> stars = [
      const Star.empty(),
      const SizedBox(width: Gap.x1),
      const Star.empty(),
      const SizedBox(width: Gap.x1),
      const Star.empty(),
      const SizedBox(width: Gap.x1),
      const Star.empty(),
      const SizedBox(width: Gap.x1),
      const Star.empty(),
      const SizedBox(width: Gap.x1),
    ];

    if (rating >= 0.5) {
      stars[0] = const Star.half();
    }
    if (rating >= 1) {
      stars[0] = const Star.full();
    }

    if (rating >= 1.5) {
      stars[2] = const Star.half();
    }
    if (rating >= 2) {
      stars[2] = const Star.full();
    }

    if (rating >= 2.5) {
      stars[4] = const Star.half();
    }
    if (rating >= 3) {
      stars[4] = const Star.full();
    }

    if (rating >= 3.5) {
      stars[6] = const Star.half();
    }
    if (rating >= 4) {
      stars[6] = const Star.full();
    }

    if (rating >= 4.5) {
      stars[8] = const Star.half();
    }
    if (rating >= 4.8) {
      stars[8] = const Star.full();
    }

    return Row(
      children: stars,
    );
  }
}
