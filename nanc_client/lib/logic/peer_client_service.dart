import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:tools/tools.dart';

class PeerClientService {
  PeerClientService({
    required PeerServiceFactory peerServiceFactory,
  }) : _peerServiceFactory = peerServiceFactory;

  final PeerServiceFactory _peerServiceFactory;
  PeerService? _peerService;

  PeerService get peerService => _peerService!;

  Future<PeerService> connectToBackend({
    required String backendPeerId,
    required SerializedMessageHandler messageHandler,
    required VoidCallback onClose,
  }) async {
    if (_peerService != null) {
      return peerService;
    }
    try {
      _peerService = _peerServiceFactory.createPeerService(messageHandler: messageHandler, onClose: onClose);
      await peerService.peerId;
      await peerService.connect(backendPeerId);
    } catch (error, stackTrace) {
      logError('Error on the first try to connect via p2p', error: error, stackTrace: stackTrace);
      await wait(duration: const Duration(seconds: 2));
      _peerService = _peerServiceFactory.createPeerService(messageHandler: messageHandler, onClose: onClose);
      await peerService.peerId;
      await peerService.connect(backendPeerId);
    }
    if (_peerService == null) {
      throw Exception('Error on p2p connection. Please, try again in few seconds.');
    }
    return peerService;
  }

  Future<void> disconnect() async {
    await _peerService?.dispose();
    _peerService = null;
    Analytics.sendEvent('CONNECTION_WITH_BACKEND_DISCONNECTED');
  }
}
