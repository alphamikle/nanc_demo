import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nanc/ui_kit.dart';
import 'package:nanc_analytics/nanc_analytics.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';

import '../peer_client_service.dart';
import 'page_state.dart';

class PageBloc extends Cubit<PageState> {
  PageBloc({
    required this.peerClientService,
    required this.rootKey,
  }) : super(PageState.empty());

  final PeerClientService peerClientService;
  final TextEditingController roomIdController = TextEditingController();
  final RootKey rootKey;

  final Set<String> _usedConnectionIds = {};

  Future<void> connectToBackend() async {
    emit(state.copyWith(isConnectingToTheBackend: true));
    final String backendPeerId = await decrypt(roomIdController.text);
    await peerClientService.connectToBackend(backendPeerId: backendPeerId, messageHandler: _backendMessageHandler, onClose: _onClose);
    _usedConnectionIds.add(backendPeerId);
    emit(state.copyWith(
      isConnectingToTheBackend: false,
      isConnectedToTheBackend: true,
    ));
    roomIdController.clear();
  }

  String? validateRoomId() {
    final String roomId = decryptSync(roomIdController.text);
    if (_usedConnectionIds.contains(roomId)) {
      return 'Connection expired';
    }
    return null;
  }

  Future<void> disconnect() async {
    await peerClientService.disconnect();
    _onClose();
  }

  void _onClose() {
    emit(state.copyWith(
      isConnectedToTheBackend: false,
      isConnectingToTheBackend: false,
      isLoading: false,
    ));
  }

  bool get useNetwork => false;

  Future<Json> preloadDefaultPageData() async {
    final String data = await rootBundle.loadString('assets/landing_page.json');
    final dynamic parsedData = jsonDecode(data);
    if (parsedData is List<dynamic>) {
      return castToJson(parsedData.first);
    }
    return castToJson(parsedData);
  }

  Future<void> preload(String url) async {
    emit(state.copyWith(isLoading: true));
    if (url == '/') {
      emit(state.copyWith(
        pageData: await preloadDefaultPageData(),
      ));
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _backendMessageHandler(dynamic serializedMessage) async {
    try {
      final dynamic json = jsonDecode(serializedMessage.toString());
      await _pagesUpdatesHandler(castToJson(json['value']));
    } catch (error, stackTrace) {
      logError('Error on message from the backend', error: error, stackTrace: stackTrace);
    }
  }

  Future<void> _pagesUpdatesHandler(Json payload) async {
    final String? modelId = payload[kModelId] as String?;
    final Json? pageData = payload[kPageData] as Json?;
    if (modelId != null && pageData != null) {
      unawaited(_handleNewPageData(modelId: modelId, pageData: pageData));
    }
  }

  Future<void> _handleNewPageData({required String modelId, required Json pageData}) async {
    final Color backgroundColor = rootKey.currentContext!.theme.colorScheme.primary;
    final Color contentColor = rootKey.currentContext!.theme.colorScheme.onPrimary;

    Analytics.sendEvent('CLIENT_RECEIVED_NEW_PAGE_DATA');

    ScaffoldMessenger.of(rootKey.currentContext!).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        elevation: 4,
        // showCloseIcon: true,
        backgroundColor: backgroundColor,
        // closeIconColor: contentColor,
        content: Builder(
          builder: (BuildContext context) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1, right: Gap.regular),
                  child: Icon(
                    IconPack.rmx_refresh_fill,
                    color: contentColor,
                    size: 28,
                  ),
                ),
                Text(
                  'Page updated',
                  style: context.theme.textTheme.titleLarge?.copyWith(color: contentColor),
                ),
              ],
            );
          },
        ),
      ),
    );
    emit(state.copyWith(
      pageData: pageData,
    ));
  }
}
