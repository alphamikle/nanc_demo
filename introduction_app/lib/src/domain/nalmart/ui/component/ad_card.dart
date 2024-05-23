import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../service/constants.dart';
import '../../logic/data/page_data.dart';
import 'small_body.dart';
import 'subtitle.dart';

class AdCard extends StatelessWidget {
  const AdCard({
    this.noPrefix = false,
    this.title,
    this.subtitle,
    this.image,
    super.key,
  });

  final bool noPrefix;
  final String? image;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (noPrefix == false) const SizedBox(width: Gap.x3),
          AspectRatio(
            aspectRatio: 1.3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: ColorsData.secondary,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0F000000),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: image == null
                          ? const SizedBox()
                          : Image.network(
                              image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Gap.x2),
                    child: Row(
                      children: [
                        const SizedBox(width: Gap.x2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (title != null) Subtitle(text: title!),
                            if (subtitle != null) SmallBody(text: subtitle!),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: Gap.x2,
                            right: Gap.x2,
                          ),
                          child: SizedBox.square(
                            dimension: 24,
                            child: SvgPicture.network(iconsChevronRight),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: Gap.x3),
        ],
      ),
    );
  }
}
