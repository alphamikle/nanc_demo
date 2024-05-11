import 'package:flutter/material.dart';

import '../../../tools.dart';
import '../constants.dart';
import '../page_data.dart';
import 'round_button.dart';

class Filters extends StatelessWidget {
  const Filters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: Gap.x3),
          for (int i = 0; i < filterButtons.length; i++) ...[
            RoundButton(
              title: filterButtons[i].find('title'),
              color: ColorsData.secondaryAccent,
              prefixIcon: filterButtons[i].find('prefix_icon'),
              suffixIcon: filterButtons[i].find('postfix_icon'),
            ),
            if (i < filterButtons.length - 1) const SizedBox(width: Gap.x2),
            if (i == filterButtons.length - 1) const SizedBox(width: Gap.x3),
          ],
        ],
      ),
    );
  }
}
