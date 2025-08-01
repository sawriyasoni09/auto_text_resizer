import 'package:flutter/widgets.dart';

class AutoText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int maxLines;
  final double minFontSize;
  final double maxFontSize;

  const AutoText(
      this.text, {
        super.key,
        this.style,
        this.textAlign,
        this.maxLines = 1,
        this.minFontSize = 10,
        this.maxFontSize = 100,
      });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = maxFontSize;

        final textPainter = TextPainter(
          text: TextSpan(text: text, style: style?.copyWith(fontSize: fontSize)),
          maxLines: maxLines,
          textDirection: TextDirection.ltr,
        );

        while (fontSize > minFontSize) {
          textPainter.text = TextSpan(text: text, style: style?.copyWith(fontSize: fontSize));
          textPainter.layout(maxWidth: constraints.maxWidth);

          if (!textPainter.didExceedMaxLines && textPainter.width <= constraints.maxWidth) {
            break;
          }
          fontSize -= 1;
        }

        return Text(
          text,
          style: style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize),
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}
