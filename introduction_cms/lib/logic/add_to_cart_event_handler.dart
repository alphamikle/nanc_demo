import 'package:flutter/material.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

final EventHandler addToCartEventHandler = EventHandler(
  test: (BuildContext context, Event event) => event.event == 'addToCart',
  handler: (BuildContext context, Event event) {
    final DataStorage dataStorage = DataStorage.of(context);
    final Object? oldValue = dataStorage.getValue(query: 'cart.count');
    int oldCount = oldValue is int ? oldValue : int.tryParse(oldValue.toString()) ?? 0;
    if (oldCount >= 99) {
      oldCount = 0;
    }
    dataStorage.updateValue('cart.count', oldCount + 1);
  },
);
