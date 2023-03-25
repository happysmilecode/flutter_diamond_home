import 'package:flutter/material.dart';

import '../constant/constant_color.dart';
import 'widget_text_field.dart';

class TextIconWidget extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final double? imageHeight;
  final double? imageWidth;
  final double? textSize;
  final int? maxLine;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Color? imageColor;
  final String? image;
  final String? text;
  final VoidCallback? onPressed;

  const TextIconWidget(
      {Key? key,
      this.icon,
      this.iconSize,
      this.imageHeight,
      this.imageWidth,
      this.textSize,
      this.maxLine,
      this.textColor,
      this.fontWeight,
      this.imageColor,
      this.image,
      this.onPressed,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed ?? () {},
      icon: icon != null
          ? Icon(
              icon!,
              size: iconSize ?? 14.0,
              color: imageColor ?? Colors.grey,
            )
          : Image.asset(image!,
              height: imageHeight ?? 14.0,
              width: imageHeight ?? 14.0,
              color: imageColor ?? Colors.grey),
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor: MaterialStateProperty.all(Colors.transparent)),
      label: TextWidget(
          text: text,
          maxLine: maxLine ?? 1,
          textSize: textSize ?? 16,
          fontWeight: fontWeight!,
          colorCode: textColorLight),
    );
  }
}
