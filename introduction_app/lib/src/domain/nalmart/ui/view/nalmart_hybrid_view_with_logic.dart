import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../service/constants.dart';
import '../../../../service/tools.dart';
import '../../logic/bloc/native_bloc.dart';
import '../../logic/bloc/native_state.dart';
import '../../logic/data/page_data.dart';
import '../../logic/model/ad_card_data.dart';
import '../component/brand.dart';
import '../component/electronics_card.dart';
import '../component/filters.dart';
import '../component/grocery_card.dart';
import '../component/nui_ad_card.dart';
import '../component/nui_delivery_info.dart';
import '../component/sliver_header.dart';
import '../component/subtitle.dart';

class NalmartHybridViewWithLogic extends StatelessWidget {
  const NalmartHybridViewWithLogic({
    required this.controller,
    this.isLong = false,
    this.noCacheExtent = false,
    super.key,
  });

  final bool isLong;
  final bool noCacheExtent;
  final ScrollController controller;

  Widget adBuilder(BuildContext context, int index) {
    final NativeBloc nativeBloc = context.read();
    final AdCardData data = nativeBloc.state.adCards[index];

    return NuiAdCard(
      title: data.title,
      subtitle: data.description,
      image: data.image,
      noPrefix: index > 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      cacheExtent: noCacheExtent ? 0 : null,
      slivers: [
        /// ? HEADER
        const NalmartHeader(),
        SliverList.list(
          children: [
            const SizedBox(height: Gap.x1),

            /// ? AD CARDS
            SizedBox(
              height: 280,
              child: BlocBuilder<NativeBloc, NativeState>(
                builder: (BuildContext context, NativeState state) {
                  return ListView.builder(
                    itemCount: state.adCards.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: adBuilder,
                  );
                },
              ),
            ),

            /// ? DELIVERY INFO
            SizedBox(
              height: 150,
              width: context.query.size.width,
              child: BlocBuilder<NativeBloc, NativeState>(
                builder: (BuildContext context, NativeState state) {
                  return NuiDeliveryInfo(
                    deliveryStatus: state.deliveryStatus,
                  );
                },
              ),
            ),

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

            const SizedBox(height: Gap.x5),

            /// ? BRANDS HEADER
            const Padding(
              padding: EdgeInsets.only(left: Gap.x3, right: Gap.x3, bottom: Gap.x4),
              child: Subtitle(text: brandsHeaderTitle),
            ),

            /// ? BRANDS
            SizedBox(
              height: 72,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < brands.length; i++) ...[
                    const SizedBox(width: Gap.x3),
                    Brand(image: brands[i].find('image')),
                  ],
                  const SizedBox(width: Gap.x3),
                ],
              ),
            ),

            const SizedBox(height: Gap.x6),

            /// ? ELECTRONICS HEADER
            Padding(
              padding: const EdgeInsets.only(left: Gap.x3, right: Gap.x3, bottom: Gap.x3),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: electronicsHeaderTitle,
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorsData.textBasic,
                        fontWeight: FontWeight.w500,
                        height: 1.25,
                        fontFamily: mainFont,
                      ),
                    ),
                    TextSpan(
                      text: electronicsHeaderAmount,
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

            /// ? ELECTRONICS
            SizedBox(
              height: 252,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < electronics.length; i++) ...[
                    const SizedBox(width: Gap.x3),
                    ElectronicsCard(
                      title: electronics[i].find('title'),
                      subtitle: electronics[i].find('subtitle'),
                      image: electronics[i].find('image'),
                      price: electronics[i].find('price'),
                      pricePerMonth: electronics[i].find('price_per_month'),
                      splashColor: electronics[i].find('color'),
                      count: electronics[i].find('reviews_count'),
                      rating: electronics[i].find('rating'),
                    ),
                  ],
                  const SizedBox(width: Gap.x3),
                ],
              ),
            ),

            const SizedBox(height: Gap.x5),

            const SizedBox(height: 100),
          ],
        ),
      ],
    );
  }
}
