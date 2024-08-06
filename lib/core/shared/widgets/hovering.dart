import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Hovering extends StatefulWidget {
  final void Function(PointerEnterEvent event)? onHover;
  final Widget Function(BuildContext, bool) builder;
  const Hovering({super.key, this.onHover, required this.builder});

  @override
  _HoveringState createState() => _HoveringState();
}

class _HoveringState extends State<Hovering> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHover = true;
        });
        widget.onHover?.call(event);
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: widget.builder(context, _isHover),
    );
  }
}
