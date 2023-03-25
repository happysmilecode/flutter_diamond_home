import 'package:flutter/cupertino.dart';

class DrawerItemModel {
  DrawerItemModel(
    int? id,
    String? tabName, {
    String? tabImage,
    IconData? tabIcon,
    Widget? pages,
  }) {
    _id = id;
    _tabName = tabName;
    _tabImage = tabImage;
    _tabIcon = tabIcon;
    _pages = pages;
  }

  DrawerItemModel.fromJson(dynamic json) {
    _id = json['id'];
    _tabName = json['tab_name'];
    _tabImage = json['tab_image'];
    _tabIcon = json['tab_icon'];
    _pages = json['pages'];
  }

  int? _id;
  String? _tabName;
  String? _tabImage;
  IconData? _tabIcon;
  Widget? _pages;

  int? get id => _id;

  String? get tabName => _tabName;

  String? get tabImage => _tabImage;

  IconData? get tabIcon => _tabIcon;

  Widget? get pages => _pages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tab_name'] = _tabName;
    map['tab_image'] = _tabImage;
    map['tab_icon'] = _tabIcon;
    map['pages'] = _pages;

    return map;
  }
}
