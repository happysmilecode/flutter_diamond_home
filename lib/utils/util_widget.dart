import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../component/widget_text_field.dart';
import '../constant/constant_color.dart';
import '../constant/constant_icon.dart';


List<Shadow> textShadow() {
  return [
    Shadow(
      offset: const Offset(2.0, 2.0), //position of shadow
      blurRadius: 2.0, //blur intensity of shadow
      color: Colors.grey.withOpacity(0.5), //color of shadow with opacity
    )
  ];
}

BoxDecoration containerDecoration(Color? color,
    {bool? isTopRadius,
    double? radius,
    bool? isShadow,
    Color? borderColor,
    double? borderWidth}) {
  return BoxDecoration(
    color: color,
    border: Border.all(color: borderColor ?? color!, width: borderWidth ?? 1.0),
    borderRadius: isTopRadius == null
        ? BorderRadius.circular(radius!)
        : isTopRadius
            ? BorderRadius.only(
                topLeft: Radius.circular(radius!),
                topRight: Radius.circular(radius))
            : BorderRadius.only(
                bottomLeft: Radius.circular(radius!),
                bottomRight: Radius.circular(radius)),
    boxShadow: [
      isShadow != null
          ? BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(1, 1))
          : const BoxShadow(color: Colors.transparent),
    ],
  );
}

RoundedRectangleBorder cardDecoration(
    {bool? isTopRadius,
    double? radius,
    Color? borderColor,
    double? borderWidth}) {
  return RoundedRectangleBorder(
      side: BorderSide(
          color: borderColor ?? Colors.transparent, width: borderWidth ?? 1.0),
      borderRadius: isTopRadius == null
          ? BorderRadius.circular(radius!)
          : isTopRadius
              ? BorderRadius.only(
                  topLeft: Radius.circular(radius!),
                  topRight: Radius.circular(radius))
              : BorderRadius.only(
                  bottomLeft: Radius.circular(radius!),
                  bottomRight: Radius.circular(radius)) //<-- SEE HERE
      );
}

InputBorder getBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.transparent, width: 1),
  );
}

Widget noItemFound(message) {
  return Center(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Lottie.asset('$lottiePath/data_not_found.json',
              height: 210, width: 210),
           Padding(
            padding: const EdgeInsets.only(bottom: 48.0),
            child: TextWidget(
                text: message,
                textSize: 16.0,
                fontWeight: FontWeight.w600,
                colorCode: textColor),
          ),
        ],
      ));
}
