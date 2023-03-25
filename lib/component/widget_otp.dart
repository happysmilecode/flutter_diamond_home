import 'package:flutter/material.dart';

import '../constant/constant_color.dart';
import '../constant/constant_string.dart';

class OTPWidget extends StatelessWidget {
  final bool? first;
  final bool? last;
  final Function? getText;
  final double? height;
  final double? weight;
  final double? borderRadius;
  final Color? outlineBorderColor;
  final Color? focusedBorderColor;
  final Color? disableBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? backgroundColor;

  const OTPWidget(
      {Key? key,
      this.getText,
      this.height,
      this.weight,
      this.borderRadius,
      this.outlineBorderColor,
      this.focusedBorderColor,
      this.disableBorderColor,
      this.enabledBorderColor,
      this.errorBorderColor,
      this.backgroundColor,
      @required this.first,
      @required this.last})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        cursorColor: colorPrimary,
        autofocus: true,

        onSaved: (value) => getText!(value),
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        style: const TextStyle(
            fontSize: 20.0,
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
            color: textColor),
        showCursor: true,
        readOnly: false,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,

        maxLength: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor:
              backgroundColor == null ? Colors.transparent : backgroundColor!,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          counter: const Offstage(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??8)),
            borderSide: BorderSide(
                color: outlineBorderColor == null
                    ? Colors.transparent
                    : outlineBorderColor!,
                width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??8)),
            borderSide: BorderSide(
                color: focusedBorderColor == null
                    ? Colors.transparent
                    : focusedBorderColor!,
                width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??8)),
            borderSide: BorderSide(
                color: disableBorderColor == null
                    ? Colors.transparent
                    : disableBorderColor!,
                width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??8)),
            borderSide: BorderSide(
                color: enabledBorderColor == null
                    ? Colors.transparent
                    : enabledBorderColor!,
                width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??8)),
            borderSide: BorderSide(
                color: errorBorderColor == null
                    ? Colors.transparent
                    : errorBorderColor!,
                width: 1),
          ),
          /* hintText: "*",
          hintStyle: TextStyle(
              fontSize: 26.0,
              fontFamily: 'Muli',
              fontWeight: FontWeight.bold,
              color: Colors.white),*/
        ),
      ),
    );
  }
}
