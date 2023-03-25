import 'package:flutter/material.dart';
import '../constant/constant_color.dart';

import '../constant/constant_string.dart';

class EditTextWidget extends StatelessWidget {
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final String? hintText;
  final double? iconHeight;
  final double? iconWidth;
  final double? hintTextSize;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final FontWeight? hintFontWeight;
  final Color? hintTextColor;
  final bool? isPassword;
  final Function? errorMsg;
  final Function? getText;
  final String? preImageName;
  final String? suffixImageName;
  final int? maxLength;
  final TextAlign? textAlign;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? getTextController;
  final Color? outlineBorderColor;
  final Color? focusedBorderColor;
  final Color? disableBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? backgroundColor;
  final bool? first;
  final bool? last;
  final bool? showCursor;
  final bool? readOnly;
  final int? maxLine;
  final bool? counterText;
  final GestureTapCallback? onTap;
  final GestureTapCallback? iconClick;
  final ValueChanged<String>? onFieldSubmitted;

  const EditTextWidget({
    Key? key,
    this.textSize,
    this.fontWeight,
    this.iconHeight,
    this.iconWidth,
    this.textColor,
    this.hintText,
    this.hintTextSize,
    this.hintFontWeight,
    this.hintTextColor,
    this.isPassword,
    this.verticalPadding,
    this.horizontalPadding,
    this.textInputAction,
    this.errorMsg,
    this.getText,
    this.onTap,
    this.onFieldSubmitted,
    this.textAlign,
    this.borderRadius,
    this.getTextController,
    this.outlineBorderColor,
    this.focusedBorderColor,
    this.disableBorderColor,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.backgroundColor,
    this.preImageName,
    this.suffixImageName,
    this.maxLength,
    this.first,
    this.last,
    this.iconClick,
    this.maxLine,
    this.showCursor,
    this.readOnly,
    this.textInputType,
    this.counterText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onTap: onTap,
        autofocus: false,
        controller: getTextController,
        cursorColor: appColor,
        keyboardType: textInputType,
        obscureText: isPassword!,
        textAlign: textAlign ?? TextAlign.start,
        validator: (value) => errorMsg!(context,value),
        maxLength: maxLength,
        maxLines: maxLine,
        showCursor: showCursor ?? true,
        readOnly: readOnly ?? false,
        textInputAction: textInputAction ?? TextInputAction.done,
        onFieldSubmitted: onFieldSubmitted,
        //add this line
        // onSaved: (value) => getText!(value),
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        style: TextStyle(
            fontSize: textSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight??FontWeight.normal,
            color: textColor),
        decoration: InputDecoration(
          filled: true,
          fillColor:
              backgroundColor == null ? Colors.transparent : backgroundColor!,
          contentPadding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 16,
              horizontal: horizontalPadding ?? 12),
          counterText: "",
          /*  labelText: hintText,*/
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: hintTextSize == null ? hintTextSize : textSize,
              fontFamily: fontFamily,
              fontWeight: hintFontWeight ??FontWeight.normal,
              color: hintTextColor ?? Colors.blueGrey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: BorderSide(
                color: outlineBorderColor == null
                    ? Colors.transparent
                    : outlineBorderColor!,
                width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: BorderSide(
                color: focusedBorderColor == null
                    ? Colors.transparent
                    : focusedBorderColor!,
                width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: BorderSide(
                color: disableBorderColor == null
                    ? Colors.transparent
                    : disableBorderColor!,
                width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: BorderSide(
                color: enabledBorderColor == null
                    ? Colors.transparent
                    : enabledBorderColor!,
                width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: BorderSide(
                color: errorBorderColor == null
                    ? Colors.transparent
                    : errorBorderColor!,
                width: 1),
          ),
          prefixIcon: preImageName != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Image(
                      image: AssetImage(preImageName!), height: iconHeight ?? 20,
                    width: iconWidth ?? 20))
              : null,
          suffixIcon: suffixImageName != null
              ? GestureDetector(
                  onTap: iconClick,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Image(
                      image: AssetImage(suffixImageName!),
                      height: iconHeight ?? 18,
                      width: iconWidth ?? 18,
                    ),
                  ),
                )
              : null,
        ));
  }
}
