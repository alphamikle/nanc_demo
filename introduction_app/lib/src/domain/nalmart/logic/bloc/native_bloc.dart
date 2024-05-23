import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui/nui.dart';

import '../../ui/component/delivery_info.dart';
import '../model/ad_card_data.dart';
import 'native_state.dart';

class NativeBloc extends Cubit<NativeState> {
  NativeBloc({
    required this.dataStorage,
  }) : super(NativeState.initial());

  final DataStorage dataStorage;
  final ScrollController screenScrollController = ScrollController();
  final ScrollController adCardsScrollController = ScrollController();

  Future<void> startUpdates() async {
    final NativeState initialState = state.copyWith();

    for (int i = 0; i < 30; i++) {
      shuffleAdCards();
      await wait(duration: const Duration(milliseconds: 500));
      changeOrderStatus();
      await wait(duration: const Duration(milliseconds: 500));
    }

    emit(initialState);
  }

  void shuffleAdCards() {
    final List<AdCardData> adCards = [...state.adCards];
    adCards.shuffle();
    emit(state.copyWith(adCards: adCards));

    _shuffleDataStorageAdCards();
  }

  void changeOrderStatus() {
    final DeliveryStatus newStatus = _generateNextStatus(state.deliveryStatus);
    emit(state.copyWith(deliveryStatus: newStatus));

    _changeDataStorageStatus();
  }

  void _shuffleDataStorageAdCards() {
    final List<dynamic> dataStorageAds = [...dataStorage.getValue(query: 'ads') as List<dynamic>];
    dataStorageAds.shuffle();
    dataStorage.updateValue('ads', dataStorageAds);
  }

  void _changeDataStorageStatus() {
    final Json ordersInfo = dataStorage.getValue(query: 'order.statuses') as Json;
    final DeliveryStatus dataStorageStatus = DeliveryStatus.fromStatuses(ordersInfo);
    final DeliveryStatus newDataStorageStatus = _generateNextStatus(dataStorageStatus);
    final Json newDataStorageStatusJson = newDataStorageStatus.toStatuses();
    dataStorage.updateValue('order.statuses', newDataStorageStatusJson);
  }

  DeliveryStatus _generateNextStatus(DeliveryStatus status) {
    final DeliveryStatus newStatus = switch (status) {
      DeliveryStatus.noInfo => DeliveryStatus.placed,
      DeliveryStatus.placed => DeliveryStatus.preparing,
      DeliveryStatus.preparing => DeliveryStatus.onTheWay,
      DeliveryStatus.onTheWay => DeliveryStatus.delivered,
      DeliveryStatus.delivered => DeliveryStatus.noInfo,
    };
    return newStatus;
  }
}
