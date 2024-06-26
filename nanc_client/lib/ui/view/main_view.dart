import 'dart:async';

import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc/ui_kit.dart';
import 'package:nanc_analytics/nanc_analytics.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui/nui.dart';
import 'package:nui_svg_renderer/nui_svg_renderer.dart';

import '../../logic/bloc/page_bloc.dart';
import '../../logic/bloc/page_state.dart';
import '../components/connection_modal.dart';
import '../components/content_page.dart';

class MainView extends StatefulWidget {
  const MainView({
    required this.isRoot,
    super.key,
  });

  final bool isRoot;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final TextEditingController offerTextController = TextEditingController();
  final TextEditingController answerTextController = TextEditingController();
  late final List<TagRenderer> tagsRenderer = _prepareTagsRenderer();
  bool isScreenReadyToShow = false;
  final StreamController<String> preloadingTextStreamController = StreamController.broadcast();

  Future<void> showConnectionManager() async {
    Analytics.sendEvent('CLIENT_OPENED_CONNECTION_MANAGER');
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) => const ConnectionModal(),
    );
  }

  List<TagRenderer> _prepareTagsRenderer() {
    return [
      carouselSliderRenderer(),
      svgRenderer(),
    ];
  }

  Future<void> _startLoadingAnimation() async {
    final List<String> content = [
      'Loading   ',
      'Loading.  ',
      'Loading.. ',
      'Loading...',
      'Loading ..',
      'Loading  .',
    ];
    for (int i = 0; i < 250; i++) {
      preloadingTextStreamController.add(content[i % content.length]);
      await wait(duration: const Duration(milliseconds: 120));
    }
  }

  @override
  void initState() {
    super.initState();
    unawaited(_startLoadingAnimation());
  }

  @override
  void dispose() {
    unawaited(preloadingTextStreamController.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<PageBloc, PageState>(
        // buildWhen: (PageState previous, PageState current) => previous.screenData != current.screenData,
        builder: (BuildContext context, PageState state) {
          final Widget preloader = Center(
            child: StreamBuilder<String>(
              stream: preloadingTextStreamController.stream,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return Container(
                  color: Colors.red.withOpacity(0),
                  width: 110,
                  child: Text(
                    snapshot.data ?? '',
                    style: context.theme.textTheme.titleLarge,
                  ),
                );
              },
            ),
          );

          final String screenData = state.screenData;

          return KitScreenPreloader(
            delayBeforeBuildChild: const Duration(milliseconds: 50),
            delayAfterBuildChild: const Duration(milliseconds: 1600),
            timeForHide: const Duration(milliseconds: 400),
            onShowChild: () => safeSetState(() => isScreenReadyToShow = true),
            loader: preloader,
            builder: (_) => ContentPage(
              content: screenData,
              nodes: null,
              binary: null,
              pageData: state.pageData,
              renderers: tagsRenderer,
            ),
          );
        },
      ),
      floatingActionButton: BlocBuilder<PageBloc, PageState>(
        builder: (BuildContext context, PageState state) {
          String fabText = 'Connect to Nanc';
          Color fabColor = context.theme.colorScheme.tertiary;
          if (state.isConnectingToTheBackend || state.isLoading) {
            fabText = 'Connecting...';
            fabColor = context.theme.colorScheme.outline;
          }
          if (state.isConnectedToTheBackend) {
            fabText = 'Disconnect from Nanc';
            fabColor = context.theme.colorScheme.error;
          }

          return AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isScreenReadyToShow ? 1 : 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: FloatingActionButton(
                key: ValueKey(fabText),
                backgroundColor: fabColor,
                onPressed: state.isLoading ? null : showConnectionManager,
                tooltip: fabText,
                child: state.isLoading
                    ? KitCirclePreloader(
                        color: context.theme.colorScheme.onPrimary,
                      )
                    : Icon(
                        IconPack.mdi_connection,
                        color: context.theme.colorScheme.onTertiary,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
