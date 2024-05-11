import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../page_data.dart';

enum StarClass {
  empty,
  half,
  full,
}

class Star extends StatelessWidget {
  const Star({
    required this.starClass,
    super.key,
  });

  const Star.empty({
    super.key,
  }) : starClass = StarClass.empty;

  const Star.half({
    super.key,
  }) : starClass = StarClass.half;

  const Star.full({
    super.key,
  }) : starClass = StarClass.full;

  final StarClass starClass;

  @override
  Widget build(BuildContext context) {
    final String icon = switch (starClass) {
      StarClass.empty => iconsStarEmpty,
      StarClass.half => iconsStarHalf,
      StarClass.full => iconsStarFull,
    };

    return SizedBox.square(
      dimension: 16,
      child: SvgPicture.network(icon),
    );
  }
}
