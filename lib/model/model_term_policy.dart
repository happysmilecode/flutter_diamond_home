/// status : true
/// message : "The  Privacy Policy get successfully."
/// data : {"id":"1","title":"Privacy Policy","description":"","created_on":"2022-03-25 12:06:02"}

class TermPolicyModel {
  TermPolicyModel({
      bool? status, 
      String? message, 
      TermPolicyData? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  TermPolicyModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? TermPolicyData.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  TermPolicyData? _data;
TermPolicyModel copyWith({  bool? status,
  String? message,
  TermPolicyData? data,
}) => TermPolicyModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  TermPolicyData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : "1"
/// title : "Privacy Policy"
/// description : ""
/// created_on : "2022-03-25 12:06:02"

class TermPolicyData {
  TermPolicyData({
      String? id, 
      String? title, 
      String? description, 
      String? createdOn,}){
    _id = id;
    _title = title;
    _description = description;
    _createdOn = createdOn;
}

  TermPolicyData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _createdOn = json['created_on'];
  }
  String? _id;
  String? _title;
  String? _description;
  String? _createdOn;
TermPolicyData copyWith({  String? id,
  String? title,
  String? description,
  String? createdOn,
}) => TermPolicyData(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  createdOn: createdOn ?? _createdOn,
);
  String? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get createdOn => _createdOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['created_on'] = _createdOn;
    return map;
  }

}