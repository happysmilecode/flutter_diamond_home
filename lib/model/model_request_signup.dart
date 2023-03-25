/// title : "Super hero squad"
/// user_name : "Super hero squad"
/// first_name : "Super hero squad"
/// last_name : "Super hero squad"
/// email : "Super hero squad"
/// phone : "Super hero squad"
/// password : "Super hero squad"
/// city : "Super hero squad"
/// language : "Super hero squad"
/// country : "Super hero squad"
/// address : "Super hero squad"
/// idr_number : "Super hero squad"

class RequestSignupModel {
  RequestSignupModel({
      String? title, 
      String? userName, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? phone, 
      String? password, 
      String? city, 
      String? language, 
      String? country, 
      String? address, 
      String? idrNumber,}){
    _title = title;
    _userName = userName;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _password = password;
    _city = city;
    _language = language;
    _country = country;
    _address = address;
    _idrNumber = idrNumber;
}

  RequestSignupModel.fromJson(dynamic json) {
    _title = json['title'];
    _userName = json['user_name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _phone = json['phone'];
    _password = json['password'];
    _city = json['city'];
    _language = json['language'];
    _country = json['country'];
    _address = json['address'];
    _idrNumber = json['idr_number'];
  }
  String? _title;
  String? _userName;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _password;
  String? _city;
  String? _language;
  String? _country;
  String? _address;
  String? _idrNumber;

  String? get title => _title;
  String? get userName => _userName;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  String? get password => _password;
  String? get city => _city;
  String? get language => _language;
  String? get country => _country;
  String? get address => _address;
  String? get idrNumber => _idrNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['user_name'] = _userName;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['password'] = _password;
    map['city'] = _city;
    map['language'] = _language;
    map['country'] = _country;
    map['address'] = _address;
    map['idr_number'] = _idrNumber;
    return map;
  }

}