import 'dart:async';

import 'package:additions/additions.dart';
import 'package:cms/cms.dart';
import 'package:components/components.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fonts/fonts.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:tools/tools.dart';

import 'api/page_api_implementation.dart';
import 'api/page_list_api_implementation.dart';
import 'connection_manager/logic/connection_manager_bloc.dart';
import 'connection_manager/ui/view/webrtc_connection_manager_overlay.dart';
import 'mock_model_api.dart';
import 'models/bullet.dart';
import 'models/developer.dart';
import 'models/feature.dart';
import 'models/image.dart';
import 'models/landing_page.dart';
import 'models/landing_page_v2.dart';
import 'models/new_main_page.dart';
import 'models/position.dart';
import 'models/review.dart';

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
        return MultiBlocProvider(
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
      },
      predefinedModels: [
        bullet,
        developer,
        feature,
        image,
        landingPage,
        review,
        position,
        landingPageV2,
        newMainPageModel,
      ],
      customRenderers: [
        carouselSliderRenderer(),
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
    ),
  );
}
