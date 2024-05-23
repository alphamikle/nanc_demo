import 'package:flutter/cupertino.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  const SliverHeaderDelegate({
    required this.child,
    required this.maxExtent,
    required this.minExtent,
  });

  final Widget child;

  @override
  final double maxExtent;

  @override
  final double minExtent;

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }
}
