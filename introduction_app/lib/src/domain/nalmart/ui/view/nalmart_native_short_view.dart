import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../service/constants.dart';
import '../../../../service/tools.dart';
import '../../logic/data/page_data.dart';
import '../component/ad_card.dart';
import '../component/delivery_info.dart';
import '../component/filters.dart';
import '../component/grocery_card.dart';
import '../component/sliver_header.dart';

class NalmartNativeShortWidget extends StatelessWidget {
  const NalmartNativeShortWidget({
    super.key,
  });

  Widget adBuilder(BuildContext context, int index) {
    final Json ad = ads[index];
    return AdCard(
      title: ad['title'].toString(),
      subtitle: ad['description'].toString(),
      image: ad['image'].toString(),
      noPrefix: index > 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// ? HEADER
        const NalmartHeader(),
        SliverList.list(
          children: [
            const SizedBox(height: Gap.x1),

            /// ? AD CARDS
            SizedBox(
              height: 280,
              child: ListView.builder(
                itemCount: ads.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: adBuilder,
              ),
            ),

            /// ? DELIVERY INFO
            const DeliveryInfo(deliveryStatus: DeliveryStatus.onTheWay),

            const SizedBox(height: Gap.x4),

            /// ? FILTERS
            const Filters(),

            const SizedBox(height: Gap.x4),

            /// ? GROCERIES HEADER
            Padding(
              padding: const EdgeInsets.only(left: Gap.x3, right: Gap.x3),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: groceriesHeaderTitle,
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorsData.textBasic,
                        fontWeight: FontWeight.w500,
                        height: 1.25,
                        fontFamily: mainFont,
                      ),
                    ),
                    TextSpan(
                      text: groceriesHeaderAmount,
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorsData.textLight,
                        fontWeight: FontWeight.w500,
                        height: 1.25,
                        fontFamily: mainFont,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Gap.x3),

            /// ? GROCERIES
            SizedBox(
              height: 252,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < groceries.length; i++) ...[
                    const SizedBox(width: Gap.x3),
                    GroceryCard(
                      title: groceries[i].find('title'),
                      subtitle: groceries[i].find('subtitle'),
                      image: groceries[i].find('image'),
                      price: groceries[i].find('price'),
                      pricePerUnit: groceries[i].find('price_per_unit'),
                      splashColor: groceries[i].find('color'),
                      inStock: groceries[i].find('is_in_stock'),
                    ),
                  ],
                  const SizedBox(width: Gap.x3),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
