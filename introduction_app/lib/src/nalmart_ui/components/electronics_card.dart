import 'package:flutter/material.dart';

import '../constants.dart';
import '../page_data.dart';
import 'middle_body.dart';
import 'rating.dart';
import 'round_button.dart';
import 'small_body.dart';

class ElectronicsCard extends StatelessWidget {
  const ElectronicsCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.pricePerMonth,
    required this.count,
    required this.rating,
    this.splashColor,
    super.key,
  });

  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String pricePerMonth;
  final double rating;
  final int count;

  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.65,
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: ColorsData.quaternaryLighten, width: 1.6),
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
                        padding: const EdgeInsets.only(left: Gap.x2, right: Gap.x2, bottom: Gap.x2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallBody(text: subtitle),
                            MiddleBody(text: title),
                            const SizedBox(height: Gap.x2),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: pricePerMonth, style: const TextStyle(color: ColorsData.textBasic, fontSize: 14)),
                                  TextSpan(text: price, style: const TextStyle(color: ColorsData.textBasic, fontSize: 14)),
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
                                Rating(rating: rating),
                                const SizedBox(width: Gap.x1),
                                SmallBody(text: count.toString(), color: ColorsData.textLight),
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
