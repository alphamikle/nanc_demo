import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../service/tools.dart';
import '../../logic/data/page_data.dart';
import 'grocery_card.dart';
import 'simple_grid.dart';

class NativeGrid extends StatelessWidget {
  const NativeGrid({
    super.key,
  });

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

        return card;
      },
    );
  }
}
