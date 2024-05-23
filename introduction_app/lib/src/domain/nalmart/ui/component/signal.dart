import 'package:flutter/material.dart';

class Signal extends StatefulWidget {
  const Signal({
    required this.onShow,
    required this.child,
    super.key,
  });

  final VoidCallback onShow;
  final Widget child;

  @override
  State<Signal> createState() => _SignalState();
}

class _SignalState extends State<Signal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      widget.onShow();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
