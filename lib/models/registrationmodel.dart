import 'dart:convert';

class RegistrationModel {
  String? Username;
  String? email;
  String? password;
  String? imgurl;
  RegistrationModel({
    this.Username,
    this.email,
    this.password,
    this.imgurl,
  });


  

  RegistrationModel copyWith({
    String? Username,
    String? email,
    String? password,
    String? imgurl,
  }) {
    return RegistrationModel(
      Username: Username ?? this.Username,
      email: email ?? this.email,
      password: password ?? this.password,
      imgurl: imgurl ?? this.imgurl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Username': Username,
      'email': email,
      'password': password,
      'imgurl': imgurl,
    };
  }

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      Username: map['Username'],
      email: map['email'],
      password: map['password'],
      imgurl: map['imgurl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationModel.fromJson(String source) => RegistrationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegistrationModel(Username: $Username, email: $email, password: $password, imgurl: $imgurl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RegistrationModel &&
      other.Username == Username &&
      other.email == email &&
      other.password == password &&
      other.imgurl == imgurl;
  }

  @override
  int get hashCode {
    return Username.hashCode ^
      email.hashCode ^
      password.hashCode ^
      imgurl.hashCode;
  }
}
