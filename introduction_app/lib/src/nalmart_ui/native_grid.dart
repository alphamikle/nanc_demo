import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../tools.dart';
import 'components/grocery_card.dart';
import 'components/signal.dart';
import 'page_data.dart';
import 'simple_grid.dart';

class NativeGrid extends StatelessWidget {
  const NativeGrid({
    required this.onShow,
    super.key,
  });

  final VoidCallback onShow;

  @override
  Widget build(BuildContext context) {
    return SimpleGrid(
      itemCount: 100,
      builder: (BuildContext context, int index) {
        final Json info = groceries[index % groceries.length];

        final Widget card = GroceryCard(
          title: info.find('title'),
          subtitle: info.find('subtitle'),
          image: info.find('image'),
          price: info.find('price'),
          pricePerUnit: info.find('price_per_unit'),
          inStock: info.find('is_in_stock'),
          splashColor: info.find('splash_color'),
        );

        if (index == 5) {
          return Signal(onShow: onShow, child: card);
        }

        return card;
      },
    );
  }
}
