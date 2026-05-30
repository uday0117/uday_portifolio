import 'package:flutter/material.dart';

import '../core/utils/responsive_helper.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({required this.child, this.padding, super.key});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final horizontal = ResponsiveHelper.horizontalPadding(context);
    return Padding(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: horizontal, vertical: 44),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}
