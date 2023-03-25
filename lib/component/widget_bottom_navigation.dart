import 'package:flutter/material.dart';
import '../constant/constant_color.dart';

import '../constant/constant_string.dart';
import '../model/model_bottom_tab_name.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int? pageIndex;
  final bool? isSelectedLabelShowText;
  final bool? isUnselectedLabelShowText;
  final bool? isSelectedLabelItalic;
  final bool? isUnselectedLabelItalic;
  final double? selectedLabelTextSize;
  final double? unselectedLabelTextSize;
  final double? bottomTabRadius;
  final double? bottomTabHeight;
  final FontWeight? selectedLabelTextFontWeight;
  final FontWeight? unselectedLabelTextFontWeight;
  final Color? selectedLabelTextColor;
  final Color? unselectedLabelTextColor;
  final Color? backgroundColor;
  final Color? selectTabColor;
  final Color? unselectTabColor;
  final ValueChanged<int>? onPageChanged;
  final List<BottomTabNameModel> tabItem;

  const BottomNavigationWidget(
      {Key? key,
      this.pageIndex,
      this.isSelectedLabelShowText,
      this.isUnselectedLabelShowText,
      this.isSelectedLabelItalic,
      this.isUnselectedLabelItalic,
      this.bottomTabRadius,
      this.bottomTabHeight,
      this.selectedLabelTextSize,
      this.unselectedLabelTextSize,
      this.selectedLabelTextFontWeight,
      this.unselectedLabelTextFontWeight,
      this.selectedLabelTextColor,
      this.unselectedLabelTextColor,
      this.backgroundColor,
      this.selectTabColor,
      this.unselectTabColor,
      this.onPageChanged,
      required this.tabItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomTabHeight,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0.0, 6.0),
                spreadRadius: 2.0)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(bottomTabRadius ?? 1.0),
              topRight: Radius.circular(bottomTabRadius ?? 1.0))),
      child: BottomNavigationBar(
        currentIndex: pageIndex!,
        onTap: onPageChanged,
        backgroundColor: backgroundColor ?? whiteColor,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          for (BottomTabNameModel item in tabItem) bottomBuildItem(item)
        ],
        unselectedLabelStyle: TextStyle(
            fontSize: unselectedLabelTextSize,
            fontStyle:
                isUnselectedLabelItalic != null ? FontStyle.italic : null,
            fontFamily: fontFamily,
            fontWeight: unselectedLabelTextFontWeight,
            color: unselectedLabelTextColor),
        selectedLabelStyle: TextStyle(
            fontSize: selectedLabelTextSize,
            fontStyle: isSelectedLabelItalic != null ? FontStyle.italic : null,
            fontFamily: fontFamily,
            fontWeight: selectedLabelTextFontWeight,
            color: selectedLabelTextColor),
        showSelectedLabels: isSelectedLabelShowText ?? true,
        showUnselectedLabels: isUnselectedLabelShowText ?? true,
        selectedItemColor: selectedLabelTextColor,
        unselectedItemColor: unselectedLabelTextColor,
      ),
    );
  }

  BottomNavigationBarItem bottomBuildItem(BottomTabNameModel item) {
    return BottomNavigationBarItem(
        label: item.tabName,
        icon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: selectTabColor == null
              ? Image.asset(
                  pageIndex == item.id
                      ? item.selectImage!
                      : item.unselectImage!,
                  height: 20.0)
              : Image.asset(item.tabImage!,
                  height: 24.0,
                  color:
                      pageIndex == item.id ? selectTabColor : unselectTabColor),
        ));
  }
}
