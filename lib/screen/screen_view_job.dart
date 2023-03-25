import 'package:flutter/material.dart';

import 'screen_view_jobs_1.dart';
import 'screen_view_jobs_2.dart';

class ViewJobScreen extends StatefulWidget {
  const ViewJobScreen({Key? key}) : super(key: key);

  @override
  ViewJobScreenState createState() => ViewJobScreenState();
}

class ViewJobScreenState extends State<ViewJobScreen>
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
        ViewJobs1Screen(),
        ViewJobs2Screen(),
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
