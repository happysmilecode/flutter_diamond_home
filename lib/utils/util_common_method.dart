import 'package:flutter/material.dart';

import '../constant/constant_string.dart';
import '../main.dart';
import 'util_shared_preference.dart';



bool isNullString(String? value) {
  if (value == null || value.isEmpty || value == "") {
    return true;
  } else {
    return false;
  }
}

BoxDecoration createDecoration(Color? color,
    {bool? isTopRadius, double? radius, bool? isShadow}) {
  return BoxDecoration(
    color: color,
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
          offset: Offset(1, 1))
          : BoxShadow(color: Colors.transparent),
    ],
  );
}


