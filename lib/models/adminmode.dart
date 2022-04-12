import 'dart:convert';

class AdminsModel {
  String Username;
  String email;
  String password;
  String imgurl;
  AdminsModel({
    required this.Username,
    required this.email,
    required this.password,
    required this.imgurl,
  });
  

  AdminsModel copyWith({
    String? Username,
    String? email,
    String? password,
    String? imgurl,
  }) {
    return AdminsModel(
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

  factory AdminsModel.fromMap(Map<String, dynamic> map) {
    return AdminsModel(
      Username: map['Username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      imgurl: map['imgurl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminsModel.fromJson(String source) => AdminsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AdminsModel(Username: $Username, email: $email, password: $password, imgurl: $imgurl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AdminsModel &&
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
