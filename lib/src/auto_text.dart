import 'package:flutter/material.dart';

class AutoText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int maxLines;
  final TextAlign textAlign;
  final double minFontSize;
  final double maxFontSize;

  const AutoText(
      this.text, {
        super.key,
        this.style,
        this.maxLines = 1,
        this.textAlign = TextAlign.start,
        this.minFontSize = 12,
        this.maxFontSize = 40,
      });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = maxFontSize;

        final textPainter = TextPainter(
          text: TextSpan(text: text, style: style?.copyWith(fontSize: fontSize)),
          textDirection: TextDirection.ltr,
          maxLines: maxLines,
        );

        while (fontSize > minFontSize) {
          textPainter.text =
              TextSpan(text: text, style: style?.copyWith(fontSize: fontSize));
          textPainter.layout(maxWidth: constraints.maxWidth);

          if (textPainter.didExceedMaxLines ||
              textPainter.width > constraints.maxWidth) {
            fontSize -= 1;
          } else {
            break;
          }
        }

        return Text(
          text,
          style: style?.copyWith(fontSize: fontSize) ??
              TextStyle(fontSize: fontSize),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
        );
      },
    );
  }
}
