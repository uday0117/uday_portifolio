import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedSection extends StatefulWidget {
  const AnimatedSection({
    required this.child,
    this.delay = Duration.zero,
    super.key,
  });

  final Widget child;
  final Duration delay;

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    unawaited(
      Future<void>.delayed(widget.delay, () {
        if (mounted) {
          setState(() => _isVisible = true);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      offset: _isVisible ? Offset.zero : const Offset(0, 0.06),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeOut,
        opacity: _isVisible ? 1 : 0,
        child: widget.child,
      ),
    );
  }
}
