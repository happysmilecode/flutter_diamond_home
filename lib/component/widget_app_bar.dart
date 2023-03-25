import 'package:flutter/material.dart';
import '../component/widget_text_field.dart';
import '../constant/constant_color.dart';

import '../constant/constant_string.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color? backIconColor;
  final Color? iconBackgroundColor;
  final Color? backgroundColor;
  final GestureTapCallback? onPress;
  final double? elevation;
  final bool? centerTitle;
  final double? backIconSize;
  final Color? headerTextColor;
  final Color? tabBackgroundColor;
  final Color? unselectedTabColor;
  final Color? indicatorColor;
  final Color? selectedTabColor;
  final String? headerText;
  final double? headerTextSize;
  final double? titleSpacing;
  final FontWeight? headerFontWeight;
  final List<Widget>? actionList;
  final List<Widget>? tabList;
  final double? leadingWidth;
  final ValueChanged<int>? onTabClick;
  final double? unselectedTextSize;
  final String? unselectedFontFamily;
  final FontWeight? unselectedFontWeight;
  final double? selectedTextSize;
  final String? selectedFontFamily;
  final IconData? backArrow;
  final String? customHeaderIcon;
  final FontWeight? selectedFontWeight;

  const AppBarWidget({
    Key? key,
    this.backIconColor,
    this.iconBackgroundColor,
    this.backgroundColor,
    this.onPress,
    this.elevation,
    this.centerTitle,
    this.headerTextColor,
    this.tabBackgroundColor,
    this.unselectedTabColor,
    this.selectedTabColor,
    this.indicatorColor,
    this.headerText,
    this.titleSpacing,
    this.headerTextSize,
    this.headerFontWeight,
    this.actionList,
    this.tabList,
    this.backIconSize,
    this.backArrow,
    this.leadingWidth,
    this.onTabClick,
    this.customHeaderIcon,
    this.unselectedTextSize,
    this.unselectedFontFamily,
    this.unselectedFontWeight,
    this.selectedTextSize,
    this.selectedFontFamily,
    this.selectedFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation ?? 0,
      titleSpacing: titleSpacing ?? 0,
      centerTitle: centerTitle ?? false,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? Colors.white,
      leading: GestureDetector(
          onTap: onPress ?? () => Navigator.pop(context),
          child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: iconBackgroundColor ?? Colors.transparent,
              ),
              child: Icon(backArrow,
                  size: backIconSize, color: backIconColor ?? blackColor))),
      leadingWidth: leadingWidth ?? 0,
      title: customHeaderIcon != null
          ? Row(
              children: [
                Image.asset(
                  customHeaderIcon!,
                ),
                TextWidget(
                    text: headerText ?? "",
                    textSize: headerTextSize,
                    fontWeight: headerFontWeight,
                    colorCode: headerTextColor ?? blackColor),
              ],
            )
          : TextWidget(
              text: headerText ?? "",
              textSize: headerTextSize,
              fontWeight: headerFontWeight,
              colorCode: headerTextColor ?? blackColor),
      actions: actionList,
      bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 60.0),
          child: tabList != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 6.0),
                  child: TabBar(
                      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                      unselectedLabelColor:
                          unselectedTabColor ?? Colors.transparent,
                      unselectedLabelStyle: TextStyle(
                          fontSize: unselectedTextSize,
                          fontFamily: unselectedFontFamily ?? fontFamily,
                          fontWeight: unselectedFontWeight,
                          color: selectedTabColor),
                      labelStyle: TextStyle(
                          fontSize: selectedTextSize,
                          fontFamily: selectedFontFamily ?? fontFamily,
                          fontWeight: selectedFontWeight ?? FontWeight.w500,
                          color: unselectedTabColor),
                      indicatorColor: indicatorColor ?? Colors.transparent,
                      labelColor: selectedTabColor ?? Colors.transparent,
                      onTap: onTabClick,
                      tabs: tabList!))
              : const SizedBox()),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(tabList != null ? 120 : kToolbarHeight);
  }
}
