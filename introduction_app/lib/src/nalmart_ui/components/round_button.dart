import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.textColor,
    super.key,
  });

  final String title;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 6, top: 6, right: 6, bottom: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 2,
                      right: 4,
                    ),
                    child: SizedBox.square(
                      dimension: 20,
                      child: Center(
                        child: SvgPicture.network(prefixIcon!),
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 6),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: mainFont,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (suffixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 6,
                      right: 6,
                    ),
                    child: SizedBox.square(
                      dimension: 10,
                      child: Center(
                        child: SvgPicture.network(suffixIcon!),
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 6),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
