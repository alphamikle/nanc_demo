import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../service/constants.dart';
import '../../logic/data/page_data.dart';
import 'middle_body.dart';
import 'round_button.dart';
import 'small_body.dart';

class GroceryCard extends StatelessWidget {
  const GroceryCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.pricePerUnit,
    this.inStock = false,
    this.splashColor,
    super.key,
  });

  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String pricePerUnit;

  final bool inStock;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.65,
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorsData.quaternaryLighten,
                width: 1.6,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Image.network(image),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: Gap.x2,
                          right: Gap.x2,
                          bottom: Gap.x2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallBody(text: subtitle),
                            MiddleBody(text: title),
                            const SizedBox(height: Gap.x2),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: price, style: const TextStyle(color: ColorsData.textBasic, fontSize: 14)),
                                  TextSpan(text: pricePerUnit, style: const TextStyle(color: ColorsData.textLight, fontSize: 14)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 1.6, width: 500, color: ColorsData.quaternaryLighten),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: Gap.x2, right: Gap.x2),
                            child: Row(
                              children: [
                                SmallBody(text: inStock ? 'In stock' : 'Out of stock', color: ColorsData.textBasic),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Container(
                                    width: 1,
                                    height: 14,
                                    color: ColorsData.textBasic,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: SvgPicture.network(iconsLocation),
                                ),
                                const SizedBox(width: 2),
                                const SmallBody(
                                  text: 'S23',
                                  color: ColorsData.textBasic,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () {},
                splashColor: splashColor,
                highlightColor: const Color(0x00FFFFFF),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const Positioned(
            top: 8,
            right: 8,
            child: RoundButton(
              title: 'Add',
              color: ColorsData.primary,
              textColor: ColorsData.secondary,
              prefixIcon: iconsPlus,
            ),
          ),
        ],
      ),
    );
  }
}
