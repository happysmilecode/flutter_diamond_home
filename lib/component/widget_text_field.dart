import 'package:flutter/material.dart';

import '../constant/constant_string.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final double? textSize;
  final double? letterSpacing;
  final Color? colorCode;
  final int? maxLine;
  final FontWeight? fontWeight;
  final Function? press;
  final TextDecoration? textDecoration;
  final bool? isItalic;
  final TextAlign? textAlign;
  final String? fontFamilyNew;
  final List<Shadow>? shadows;

  const TextWidget(
      {Key? key,
      this.text,
      this.textSize,
      this.colorCode,
      this.letterSpacing,
      this.maxLine,
      this.fontWeight,
      this.textDecoration,
      this.isItalic,
      this.textAlign,
      this.fontFamilyNew,
      this.shadows,
      this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: press as GestureTapCallback?,
      child: Text(text!,
          textAlign: textAlign != null ? TextAlign.center : textAlign,
          overflow: maxLine != null ? TextOverflow.ellipsis : null,
          maxLines: maxLine,

          style: TextStyle(
              decoration: textDecoration,
              fontSize: textSize,
              letterSpacing: letterSpacing??0.5,
              fontStyle: isItalic != null ? FontStyle.italic : null,
              fontFamily: fontFamilyNew ?? fontFamily,
              fontWeight: fontWeight,
              color: colorCode,
              shadows: shadows)),
    );
  }
}
