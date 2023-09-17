/// firstName : ""
/// lastName : ""
/// companyName : ""
/// phone : ""
/// email : ""
/// dateOfBirth : ""
/// profile : ""

class ContactEntity {
  ContactEntity({
      String? firstName, 
      String? lastName, 
      String? companyName, 
      String? phone, 
      String? email, 
      String? dateOfBirth, 
      String? profile,}){
    _firstName = firstName;
    _lastName = lastName;
    _companyName = companyName;
    _phone = phone;
    _email = email;
    _dateOfBirth = dateOfBirth;
    _profile = profile;
}

  ContactEntity.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _companyName = json['companyName'];
    _phone = json['phone'];
    _email = json['email'];
    _dateOfBirth = json['dateOfBirth'];
    _profile = json['profile'];
  }
  String? _firstName;
  String? _lastName;
  String? _companyName;
  String? _phone;
  String? _email;
  String? _dateOfBirth;
  String? _profile;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get companyName => _companyName;
  String? get phone => _phone;
  String? get email => _email;
  String? get dateOfBirth => _dateOfBirth;
  String? get profile => _profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['companyName'] = _companyName;
    map['phone'] = _phone;
    map['email'] = _email;
    map['dateOfBirth'] = _dateOfBirth;
    map['profile'] = _profile;
    return map;
  }

}