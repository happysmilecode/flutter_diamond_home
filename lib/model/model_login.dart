/// status : true
/// message : "User Login successfully"
/// data : {"id":"13","title":"Mr","user_name":"sunil","first_name":"sunil","last_name":"lodhi","email":"sunil@gmail.com","email_verified_at":null,"password":"$2y$10$T4KUPCgaFSSnpMW8lv0ky.aQ1dsUkeErB0GHG/AUehTj8jZwNHZAm","phone":"8959127121","address":"123 ram bag","idr_number":null,"city":"indore","country":"india","language":"English","user_type":"user","remember_token":null,"created_at":"2022-12-16 01:50:13","updated_at":null}

class LoginModel {
  LoginModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;

  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

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

/// id : "13"
/// title : "Mr"
/// user_name : "sunil"
/// first_name : "sunil"
/// last_name : "lodhi"
/// email : "sunil@gmail.com"
/// email_verified_at : null
/// password : "$2y$10$T4KUPCgaFSSnpMW8lv0ky.aQ1dsUkeErB0GHG/AUehTj8jZwNHZAm"
/// phone : "8959127121"
/// address : "123 ram bag"
/// idr_number : null
/// city : "indore"
/// country : "india"
/// language : "English"
/// user_type : "user"
/// remember_token : null
/// created_at : "2022-12-16 01:50:13"
/// updated_at : null

class Data {
  Data({
      String? id, 
      String? title, 
      String? userName, 
      String? firstName, 
      String? lastName, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? password, 
      String? phone, 
      String? address, 
      dynamic idrNumber, 
      String? city, 
      String? country, 
      String? language, 
      String? userType, 
      dynamic rememberToken, 
      String? createdAt, 
      dynamic updatedAt,}){
    _id = id;
    _title = title;
    _userName = userName;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _password = password;
    _phone = phone;
    _address = address;
    _idrNumber = idrNumber;
    _city = city;
    _country = country;
    _language = language;
    _userType = userType;
    _rememberToken = rememberToken;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _userName = json['user_name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _password = json['password'];
    _phone = json['phone'];
    _address = json['address'];
    _idrNumber = json['idr_number'];
    _city = json['city'];
    _country = json['country'];
    _language = json['language'];
    _userType = json['user_type'];
    _rememberToken = json['remember_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _title;
  String? _userName;
  String? _firstName;
  String? _lastName;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _password;
  String? _phone;
  String? _address;
  dynamic _idrNumber;
  String? _city;
  String? _country;
  String? _language;
  String? _userType;
  dynamic _rememberToken;
  String? _createdAt;
  dynamic _updatedAt;

  String? get id => _id;
  String? get title => _title;
  String? get userName => _userName;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get password => _password;
  String? get phone => _phone;
  String? get address => _address;
  dynamic get idrNumber => _idrNumber;
  String? get city => _city;
  String? get country => _country;
  String? get language => _language;
  String? get userType => _userType;
  dynamic get rememberToken => _rememberToken;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['user_name'] = _userName;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['password'] = _password;
    map['phone'] = _phone;
    map['address'] = _address;
    map['idr_number'] = _idrNumber;
    map['city'] = _city;
    map['country'] = _country;
    map['language'] = _language;
    map['user_type'] = _userType;
    map['remember_token'] = _rememberToken;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}