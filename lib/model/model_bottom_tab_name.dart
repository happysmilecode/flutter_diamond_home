/// id : 1
/// tab_name : "name"
/// tab_image : "iamge"

class BottomTabNameModel {
  int? _id;
  String? _tabName;
  String? _tabImage;
  String? _selectImage;
  String? _unselectImage;

  BottomTabNameModel(
    int? id,
    String? tabName, {
    String? tabImage,
    String? selectImage,
    String? unselectImage,
  }) {
    _id = id;
    _tabName = tabName;
    _tabImage = tabImage;
    _selectImage = selectImage;
    _unselectImage = unselectImage;
  }

  BottomTabNameModel.fromJson(dynamic json) {
    _id = json['id'];
    _tabName = json['tab_name'];
    _tabImage = json['tab_image'];
    _selectImage = json['select_image'];
    _unselectImage = json['unselect_image'];
  }

  int? get id => _id;

  String? get tabName => _tabName;

  String? get tabImage => _tabImage;

  String? get selectImage => _selectImage;

  String? get unselectImage => _unselectImage;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tab_name'] = _tabName;
    map['tab_image'] = _tabImage;
    map['select_image'] = _selectImage;
    map['unselect_image'] = _unselectImage;
    return map;
  }
}
