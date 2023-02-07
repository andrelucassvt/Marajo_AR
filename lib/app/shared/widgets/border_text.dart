import 'package:flutter/material.dart';

class BorderTextMarajo extends StatelessWidget {
  final StrokeCap strokeCap;
  final StrokeJoin strokeJoin;
  final double strokeWidth;
  final Color strokeColor;
  final Text child;

  BorderTextMarajo({
    required this.child,
    this.strokeCap = StrokeCap.round,
    this.strokeJoin = StrokeJoin.round,
    this.strokeWidth = 3.0,
    this.strokeColor = Colors.black,
  }) : assert(child is Text);

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (child.style != null) {
      style = child.style!.copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
        color: null,
      );
    } else {
      style = TextStyle(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
      );
    }
    return Stack(
      alignment: Alignment.center,
      textDirection: child.textDirection,
      children: <Widget>[
        Text(
          child.data!,
          style: style,
          maxLines: child.maxLines,
          overflow: child.overflow,
          semanticsLabel: child.semanticsLabel,
          softWrap: child.softWrap,
          strutStyle: child.strutStyle,
          textAlign: child.textAlign,
          textDirection: child.textDirection,
          textScaleFactor: child.textScaleFactor,
        ),
        child,
      ],
    );
  }
}
