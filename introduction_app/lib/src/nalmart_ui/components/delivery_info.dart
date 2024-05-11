import 'package:flutter/material.dart';

import '../../../tools.dart';
import '../constants.dart';
import '../page_data.dart';
import 'dot.dart';
import 'left_dot.dart';
import 'line_spacer.dart';
import 'right_dot.dart';
import 'round_button.dart';
import 'small_body.dart';
import 'subtitle.dart';

class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Gap.x3, top: Gap.x5, right: Gap.x3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Subtitle(text: orderTitle),
                  SmallBody(text: orderTitle),
                ],
              ),
              Spacer(),
              RoundButton(
                title: buttonsTrack,
                prefixIcon: iconsGeo,
                color: ColorsData.primary,
                textColor: ColorsData.secondary,
              ),
            ],
          ),
          const SizedBox(height: Gap.x4),
          Row(
            children: [
              LeftDot(
                active: orderStatuses.find('placed.is_active'),
                current: orderStatuses.find('placed.is_current'),
                title: orderStatuses.find('placed.title'),
              ),
              Expanded(
                child: LineSpacer(
                  active: orderStatuses.find('preparing.is_active'),
                ),
              ),
              Dot(
                title: orderStatuses.find('preparing.title'),
                leftActive: orderStatuses.find('placed.is_active'),
                active: orderStatuses.find('preparing.is_active'),
                rightActive: orderStatuses.find('on_the_way.is_active'),
                current: orderStatuses.find('preparing.is_current'),
              ),
              Expanded(
                child: LineSpacer(
                  active: orderStatuses.find('on_the_way.is_active'),
                ),
              ),
              Dot(
                title: orderStatuses.find('on_the_way.title'),
                leftActive: orderStatuses.find('placed.is_active'),
                active: orderStatuses.find('on_the_way.is_active'),
                rightActive: orderStatuses.find('delivered.is_active'),
                current: orderStatuses.find('on_the_way.is_current'),
              ),
              Expanded(
                child: LineSpacer(
                  active: orderStatuses.find('delivered.is_active'),
                ),
              ),
              RightDot(
                title: orderStatuses.find('delivered.title'),
                active: orderStatuses.find('delivered.is_active'),
                current: orderStatuses.find('delivered.is_current'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
