import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc/ui_kit.dart';
import 'package:nanc_analytics/nanc_analytics.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../logic/connection_manager_bloc.dart';
import '../components/webrtc_connection_manager_modal.dart';

class WebRTCConnectionManagerOverlay extends StatefulWidget {
  const WebRTCConnectionManagerOverlay({
    required this.rootNavigatorKey,
    required this.child,
    super.key,
  });

  final GlobalKey<NavigatorState> rootNavigatorKey;
  final Widget child;

  @override
  State<WebRTCConnectionManagerOverlay> createState() => _WebRTCConnectionManagerOverlayState();
}

class _WebRTCConnectionManagerOverlayState extends State<WebRTCConnectionManagerOverlay> {
  bool isModalVisible = false;

  NavigatorState get rootNavigatorState => widget.rootNavigatorKey.currentState!;

  BuildContext get rootNavigatorContext => widget.rootNavigatorKey.currentContext!;

  Future<void> showConnectionModal() async {
    Analytics.sendEvent('CMS_OPENED_CONNECTION_MANAGER');
    safeSetState(() => isModalVisible = true);
    final ConnectionManagerBloc connectionManagerBloc = context.read();

    await showDialog<void>(
      barrierDismissible: false,
      context: rootNavigatorContext,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: connectionManagerBloc,
          child: WebRTCConnectionManagerModal(
            onClose: () => rootNavigatorState.pop(),
          ),
        );
      },
    );
    safeSetState(() => isModalVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (BuildContext context) {
            return Scaffold(
              body: widget.child,
              floatingActionButton: AnimatedOpacity(
                curve: Curves.easeInQuart,
                duration: const Duration(milliseconds: 250),
                opacity: isModalVisible ? 0 : 1,
                child: AbsorbPointer(
                  absorbing: isModalVisible,
                  child: KitTooltip(
                    text: 'Connect client app',
                    child: FloatingActionButton(
                      backgroundColor: context.theme.colorScheme.tertiary,
                      onPressed: showConnectionModal,
                      child: Icon(
                        IconPack.mdi_qrcode_scan,
                        color: context.theme.colorScheme.onTertiary,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
