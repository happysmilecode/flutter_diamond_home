
import 'screen_info_2.dart';
import 'package:flutter/material.dart';

import 'screen_info_1.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  InfoScreenState createState() => InfoScreenState();
}

class InfoScreenState extends State<InfoScreen>
    with SingleTickerProviderStateMixin {
  List tabList = [];
  int initTabIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: initTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      TabBar(
          padding: const EdgeInsets.symmetric(vertical: 8),
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController!,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          tabs: getTabStringArray()
              .map((item) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 6),
                    child: Text(item),
                  ))
              .toList()),
      Expanded(
          child: TabBarView(controller: _tabController, children: <Widget>[
        Info1Screen(),
        Info2Screen(),
      ])),
    ])));
  }

  List getTabStringArray() {
    return tabList = [
      "Tab 1",
      "Tab 2",
    ];
  }
}
