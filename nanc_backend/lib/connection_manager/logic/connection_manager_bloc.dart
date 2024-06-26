import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nanc/model.dart';
import 'package:nanc_analytics/nanc_analytics.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';

import 'connection_manager_state.dart';
import 'model/client.dart';

class ConnectionManagerBloc extends Cubit<ConnectionManagerState> {
  ConnectionManagerBloc({
    required this.peerServiceFactory,
  }) : super(ConnectionManagerState.empty());

  final PeerServiceFactory peerServiceFactory;

  final Map<String, PeerService> _services = {};
  final Map<String, StreamSubscription<ConnectionStatus>> _subscriptions = {};
  PeerService? _service;
  VoidCallback? _onClientConnected;

  Future<void> createConnection({VoidCallback? onClientConnected}) async {
    if (state.isNotEmptyId) {
      // Show message about already loading connection
      return;
    }
    _onClientConnected = onClientConnected;
    Analytics.sendEvent('CONNECTION_CREATION_STARTED');
    emit(state.copyWith(isLoading: true));
    _service = peerServiceFactory.createPeerService(messageHandler: _clientMessageHandler, onClose: () => _onClose('TODO'));
    final String myPeerId = await _service!.peerId;
    final String encryptedPeerId = await encrypt(myPeerId);
    emit(state.copyWith(
      freshRoomId: encryptedPeerId,
      isLoading: false,
    ));
    unawaited(_awaitConnectedClient(myPeerId));
  }

  void _clientMessageHandler(dynamic serializedMessage) {
    logInfo('Got a message from the client "$serializedMessage"');
  }

  Future<void> _onClose(String backendPeerId) async {
    logInfo('Closing connection "$backendPeerId"');
    await _disposeHandler(backendPeerId);
  }

  Future<void> sendPageDataToTheClients({required Model model, required Json page}) async {
    Analytics.sendEvent('BACKEND_SENT_NEW_PAGE_DATA', data: <String, dynamic>{
      'model_id': model.id,
      'model_name': model.name,
    });
    final Map<String, dynamic> message = <String, dynamic>{
      'messageType': kUpdatePage,
      'oneWay': true,
      'value': {
        kModelId: model.id,
        kPageData: page,
      },
    };
    final String serializedMessage = jsonEncode(message);

    for (final PeerService service in _services.values) {
      await service.sendMessage(serializedMessage);
    }
  }

  Future<void> _awaitConnectedClient(String backendPeerId) async {
    final Completer<void> connectionCompleter = Completer();
    _subscriptions[backendPeerId] = _service!.statusStream.listen((ConnectionStatus status) {
      if (status == ConnectionStatus.closed) {
        _subscriptions[backendPeerId]?.cancel();
        _onClose(backendPeerId);
      } else if (status == ConnectionStatus.connection) {
        //
      } else if (status == ConnectionStatus.connected) {
        connectionCompleter.complete();
        final List<Client> oldClients = List.of(state.clients);
        oldClients.add(
          Client(
            roomId: state.freshRoomId,
            status: ClientStatus.connected,
            serviceId: backendPeerId,
          ),
        );
        emit(state.copyWith(
          freshRoomId: '',
          clients: oldClients,
        ));
        if (_onConnected != null) {
          _onConnected!();
        }
        _services[backendPeerId] = _service!;
        _service = null;
      }
    });
    await connectionCompleter.future;
    Analytics.sendEvent('CONNECTION_CREATION_COMPLETED');
    _onClientConnected?.call();
  }

  Future<void> _disposeHandler(String serviceId) async {
    _services.remove(serviceId);
    final List<Client> clientsWithOffline = [];
    for (final Client client in state.clients) {
      if (client.serviceId == serviceId) {
        clientsWithOffline.add(client.copyWith(status: ClientStatus.disconnected));
      } else {
        clientsWithOffline.add(client);
      }
    }
    emit(state.copyWith(
      clients: clientsWithOffline,
    ));
    await wait(duration: const Duration(seconds: 1));
    final List<Client> onlineClients = clientsWithOffline.where((Client client) => client.serviceId != serviceId).toList();
    emit(state.copyWith(
      clients: onlineClients,
    ));
    Analytics.sendEvent('CONNECTION_WITH_CLIENT_DISCONNECTED');
  }

  VoidCallback? _onConnected;

  void setOnConnectedCallback(VoidCallback onConnected) => _onConnected = onConnected;
}
