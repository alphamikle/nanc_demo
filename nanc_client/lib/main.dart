import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_fonts/nanc_fonts.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:nui/nui.dart';

import 'logic/bloc/page_bloc.dart';
import 'logic/peer_client_service.dart';
import 'nanc_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final PackageInfo info = await getAppInfo();

  FontsStorage.registerCustomFonts(const [
    CustomFont(font: 'Blazeface'),
    CustomFont(font: 'Helvetica'),
  ]);

  logInfo(info.toPrettyString());

  final RootKey rootKey = GlobalKey();
  final PeerClientService peerClientService = PeerClientService(peerServiceFactory: PeerServiceFactory());
  final PageBloc pageBloc = PageBloc(peerClientService: peerClientService, rootKey: rootKey);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PeerServiceFactory>.value(value: PeerServiceFactory()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PageBloc>.value(value: pageBloc),
        ],
        child: DataStorageProvider(
          dataStorage: DataStorage(),
          child: NancApp(rootKey: rootKey),
        ),
      ),
    ),
  );
}
