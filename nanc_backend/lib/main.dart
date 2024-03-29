import 'dart:async';

import 'package:additions/additions.dart';
import 'package:components/components.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fonts/fonts.dart';
import 'package:nanc/nanc.dart';
import 'package:nanc/services.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:svg_renderer/svg_renderer.dart';
import 'package:tools/tools.dart';

import 'api/page_api_implementation.dart';
import 'api/page_list_api_implementation.dart';
import 'connection_manager/logic/connection_manager_bloc.dart';
import 'connection_manager/ui/view/webrtc_connection_manager_overlay.dart';
import 'mock_model_api.dart';
import 'models/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final PackageInfo info = await getAppInfo();
  logInfo(info.toPrettyString());

  final DbService dbService = createDbService();
  final ConnectionManagerBloc connectionManagerBloc = ConnectionManagerBloc(peerServiceFactory: PeerServiceFactory());

  await adminRunner(
    CmsConfig(
      collectionApi: PageListApiImplementation(
        dbService: dbService,
      ),
      documentApi: PageApiImplementation(
        dbService: dbService,
        connectionManagerBloc: connectionManagerBloc,
      ),
      modelApi: MockModelApi(),
      networkConfig: NetworkConfig(
        paginationLimitParameterName: 'limit',
        paginationPageNumberParameterName: 'page',
        paginationDataContainerParameterName: 'data',
        paginationTotalPagesParameterName: 'total',
        paginationLimitParameterDefaultValue: 15,
      ),
      imageBuilderDelegate: const ImageBuilderDelegate(imageFrameBuilder: imageFrameBuilder),
      adminWrapperBuilder: (BuildContext context, GlobalKey<NavigatorState> navigatorKey, Widget adminPanel) {
        const double minWidth = 1280;
        final MediaQueryData data = MediaQuery.of(context);
        double multiplier = 1;

        if (data.size.width < minWidth) {
          multiplier = minWidth / data.size.width;
        }

        logInfo('DM: $multiplier, Width: ${data.size.width}');

        final Widget cms = MultiBlocProvider(
          providers: [
            BlocProvider<ConnectionManagerBloc>.value(value: connectionManagerBloc),
          ],
          child: Builder(
            builder: (BuildContext context) {
              return WebRTCConnectionManagerOverlay(
                rootNavigatorKey: navigatorKey,
                child: adminPanel,
              );
            },
          ),
        );

        if (multiplier == 1) {
          return cms;
        }

        return InteractiveViewer(
          constrained: false,
          maxScale: 1,
          minScale: 0.1,
          child: SizedBox(
            width: minWidth,
            height: minWidth,
            child: cms,
          ),
        );
      },
      predefinedModels: [
        landingPage,
      ],
      customRenderers: [
        carouselSliderRenderer(),
        svgRenderer(),
      ],
      eventsHandlers: [
        snackbarDemoHandler,
        browserLinksEventDemoHandler,
        shareDemoHandler,
      ],
      customFonts: [
        const CustomFont(font: 'Blazeface'),
        const CustomFont(font: 'Helvetica'),
      ],
      sliverChecker: null,
      customIcons: null,
      themeBuilder: null,
    ),
  );
}
