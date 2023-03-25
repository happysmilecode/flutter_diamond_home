import 'package:flutter/material.dart';
import '../component/widget_text_field.dart';

import '../constant/constant_color.dart';
import '../model/model_drawer_tab_name.dart';

class SideDrawerWidget extends StatelessWidget {
  final Function? press;
  final double? textSize;
  final FontWeight? textFontWeight;
  final Color? textColor;
  final Color? backgroundColor;
  final bool? isFullDrawer;
  final bool? topContainer;
  final Widget? bottomContainer;
  final int? itemCount;
  final String? userName, userImage;
  final IndexedWidgetBuilder? itemBuilder;
  final List<DrawerItemModel>? itemDrawer;

  const SideDrawerWidget({
    Key? key,
    this.press,
    this.textSize,
    this.textFontWeight,
    this.textColor,
    this.backgroundColor,
    this.isFullDrawer,
    this.topContainer,
    this.itemCount,
    this.userName,
    this.userImage,
    this.itemBuilder,
    this.bottomContainer,
    this.itemDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: isFullDrawer == null ? size.width / 1.25 : size.width,
        child: Drawer(
            backgroundColor: backgroundColor ?? Colors.white,
            child: Column(children: [
              const SizedBox(height: 60),
              topContainer != null
                  ? topContainerItem(context)
                  : const SizedBox(),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      for (DrawerItemModel item in itemDrawer!)
                        listItem(item)
                    ]),
              ),
              bottomContainer != null ? bottomContainer! : const SizedBox(),
              const SizedBox(height: 36),
            ])));
  }

  Widget listItem(DrawerItemModel itemDrawer) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        horizontalTitleGap: 16.0,
        visualDensity: const VisualDensity(vertical: -2),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: itemDrawer.tabImage == null
                ? Icon(itemDrawer.tabIcon)
                : Image.asset(itemDrawer.tabImage!, height: 24.0)),
        title: TextWidget(
            text: itemDrawer.tabName!,
            textSize: textSize,
            fontWeight: textFontWeight,
            colorCode: textColor == null ? Colors.black : textColor!),
        trailing: const Icon(Icons.keyboard_arrow_right_rounded),
        onTap: () => {press!(itemDrawer.id!)},
      ),
    );
  }

  Widget topContainerItem(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(children: [
        Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(right: 24.0, left: 24.0, top: 55.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: blueColor,
              boxShadow: const [
                BoxShadow(color: Colors.grey, blurRadius: 8.0)
              ]),
          child: Column(children: [
            SizedBox(height: 54),
            TextWidget(
                text: userName,
                textSize: 18.0,
                fontWeight: FontWeight.w400,
                colorCode: Colors.white),
          ]),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
                color: Colors.grey,
                image: DecorationImage(
                    image: const NetworkImage(
                        "https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male2-512.png"),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(90.0)),
              )),
        )
      ]),
    );
  }
}
