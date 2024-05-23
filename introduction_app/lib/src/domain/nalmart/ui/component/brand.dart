import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Brand extends StatelessWidget {
  const Brand({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.square(
          dimension: 72,
          child: SvgPicture.network(image),
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            borderRadius: BorderRadius.circular(100),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}
