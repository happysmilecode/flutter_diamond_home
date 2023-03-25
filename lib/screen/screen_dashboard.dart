import 'package:diamond_homes/Screen/screen_home.dart';
import 'package:diamond_homes/screen/screen_info.dart';

import 'package:flutter/material.dart';

import '../component/widget_app_bar.dart';
import '../component/widget_drawer.dart';
import '../constant/constant_color.dart';
import '../generated/l10n.dart';
import '../model/model_drawer_tab_name.dart';

import 'screen_view_job.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  S txt = S();
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: whiteColor,
        endDrawerEnableOpenDragGesture: true,
        endDrawer: SideDrawerWidget(
            press: onClickDrawer,
            backgroundColor: greyColor,
            itemDrawer: getDrawerItem(),
            userName: "Demo Name",
            topContainer: true),
        appBar: AppBarWidget(
            backgroundColor: greyColor, actionList: getActionItem()),
        body: getDrawerItem()[tabIndex].pages);
  }

  void onClickDrawer(int page) {
    setState(() {

      Navigator.pop(context);
      tabIndex = page;
    });
  }

  List<DrawerItemModel> getDrawerItem() {
    List<DrawerItemModel> drawerItemArray = [];
    drawerItemArray.add(DrawerItemModel(0, txt.home,
        tabIcon: Icons.home, pages: const HomeScreen()));
    drawerItemArray.add(DrawerItemModel(1, txt.viewJobs,
        tabIcon: Icons.list_alt, pages: const ViewJobScreen()));
    drawerItemArray.add(DrawerItemModel(2, txt.info,
        tabIcon: Icons.group, pages: const InfoScreen()));
    drawerItemArray
        .add(DrawerItemModel(3, txt.paymentEnquiry, tabIcon: Icons.payment));
    drawerItemArray
        .add(DrawerItemModel(4, txt.detail, tabIcon: Icons.pie_chart));
    drawerItemArray
        .add(DrawerItemModel(5, txt.setting, tabIcon: Icons.settings));
    return drawerItemArray;
  }

  List<Widget> getActionItem() {
    return [
      CircleAvatar(child: Text("JD")),
      IconButton(
          onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
          icon: Icon(Icons.menu, color: Colors.blue))
    ];
  }
}
