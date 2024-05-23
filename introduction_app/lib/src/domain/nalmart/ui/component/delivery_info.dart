import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../service/constants.dart';
import '../../../../service/tools.dart';
import '../../logic/data/page_data.dart';
import 'dot.dart';
import 'left_dot.dart';
import 'line_spacer.dart';
import 'right_dot.dart';
import 'round_button.dart';
import 'small_body.dart';
import 'subtitle.dart';

enum DeliveryStatus {
  noInfo,
  placed,
  preparing,
  onTheWay,
  delivered;

  bool get isNoInfo => this == DeliveryStatus.noInfo;
  bool get isPlaced => this == DeliveryStatus.placed;
  bool get isPreparing => this == DeliveryStatus.preparing;
  bool get isOnTheWay => this == DeliveryStatus.onTheWay;
  bool get isDelivered => this == DeliveryStatus.delivered;

  Json toStatuses() {
    return {
      'placed': {
        'title': 'Placed',
        'is_active': isPlaced || isPreparing || isOnTheWay || isDelivered,
        'is_current': isPlaced,
      },
      'preparing': {
        'title': 'Preparing',
        'is_active': isPreparing || isOnTheWay || isDelivered,
        'is_current': isPreparing,
      },
      'on_the_way': {
        'title': 'On the way',
        'is_active': isOnTheWay || isDelivered,
        'is_current': isOnTheWay,
      },
      'delivered': {
        'title': 'Delivered',
        'is_active': isDelivered,
        'is_current': isDelivered,
      },
    };
  }

  static DeliveryStatus fromStatuses(dynamic json) {
    final Json statuses = castToJson(json);
    if (statuses.find('placed.is_current')) {
      return DeliveryStatus.placed;
    } else if (statuses.find('preparing.is_current')) {
      return DeliveryStatus.preparing;
    } else if (statuses.find('on_the_way.is_current')) {
      return DeliveryStatus.onTheWay;
    } else if (statuses.find('delivered.is_current')) {
      return DeliveryStatus.delivered;
    }
    return DeliveryStatus.noInfo;
  }
}

class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({
    required this.deliveryStatus,
    super.key,
  });

  final DeliveryStatus deliveryStatus;

  @override
  Widget build(BuildContext context) {
    final Json statuses = deliveryStatus.toStatuses();

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
                  SmallBody(text: orderArrivalTime),
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
          AnimatedSwitcher(
            key: ValueKey(deliveryStatus),
            duration: const Duration(milliseconds: 250),
            child: Row(
              children: [
                LeftDot(
                  active: statuses.find('placed.is_active'),
                  current: statuses.find('placed.is_current'),
                  title: orderStatuses.find('placed.title'),
                ),
                Expanded(
                  child: LineSpacer(
                    active: statuses.find('preparing.is_active'),
                  ),
                ),
                Dot(
                  title: orderStatuses.find('preparing.title'),
                  leftActive: statuses.find('placed.is_active'),
                  active: statuses.find('preparing.is_active'),
                  rightActive: statuses.find('on_the_way.is_active'),
                  current: statuses.find('preparing.is_current'),
                ),
                Expanded(
                  child: LineSpacer(
                    active: statuses.find('on_the_way.is_active'),
                  ),
                ),
                Dot(
                  title: orderStatuses.find('on_the_way.title'),
                  leftActive: statuses.find('placed.is_active'),
                  active: statuses.find('on_the_way.is_active'),
                  rightActive: statuses.find('delivered.is_active'),
                  current: statuses.find('on_the_way.is_current'),
                ),
                Expanded(
                  child: LineSpacer(
                    active: statuses.find('delivered.is_active'),
                  ),
                ),
                RightDot(
                  title: orderStatuses.find('delivered.title'),
                  active: statuses.find('delivered.is_active'),
                  current: statuses.find('delivered.is_current'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
