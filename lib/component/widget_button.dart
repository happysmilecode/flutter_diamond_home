import 'package:flutter/material.dart';
import '../component/widget_text_field.dart';



class ButtonWidget extends StatelessWidget {
  final String? textButton;
  final double? textSize;
  final FontWeight? fontWeight;
  final double? heightButton;
  final double? widthButton;
  final double? borderWidth;
  final double? borderRadius;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? gradientColorOne;
  final Color? gradientColorTwo;
  final Color? colorBorder;
  final Function? onPress;

  const ButtonWidget(
      {Key? key,
      this.textButton,
      this.textSize,
      this.fontWeight,
      this.heightButton,
      this.widthButton,
      this.borderRadius,
      this.borderWidth,
      this.textColor,
      this.backgroundColor,
      this.gradientColorOne,
      this.gradientColorTwo,
      this.colorBorder,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPress as GestureTapCallback?, // button pressed
      child: Stack(alignment: Alignment.center, children: <Widget>[
        // icon
        Container(
            height: heightButton,
            width: widthButton ?? size.width,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(
                    borderRadius == null ? 0.0 : borderRadius!),
                border:
                colorBorder != null ? Border.all(color: colorBorder!,width: borderWidth??1.0) : null,
                gradient:  LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: gradientColorOne != null
                        ? [gradientColorOne!, gradientColorTwo!]
                        : [backgroundColor!, backgroundColor!]))),
        Center(
          child: TextWidget(
              text: textButton,
              textSize: textSize,
              fontWeight: fontWeight,
              colorCode: textColor),
        ),
      ]),
    );
  }
}
