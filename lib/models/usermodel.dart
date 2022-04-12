import 'dart:convert';

class UserModel {
  String? Email;
  String? Name;
  String? PhoneNo;
  String? Photourl;
  String? userId;
  
  UserModel({
    this.Email,
    this.Name,
    this.PhoneNo,
    this.Photourl,
    this.userId,
  });



  

  UserModel copyWith({
    String? Email,
    String? Name,
    String? PhoneNo,
    String? Photourl,
    String? userId,
  }) {
    return UserModel(
      Email: Email ?? this.Email,
      Name: Name ?? this.Name,
      PhoneNo: PhoneNo ?? this.PhoneNo,
      Photourl: Photourl ?? this.Photourl,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Email': Email,
      'Name': Name,
      'PhoneNo': PhoneNo,
      'Photourl': Photourl,
      'userId': userId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      Email: map['Email'],
      Name: map['Name'],
      PhoneNo: map['PhoneNo'],
      Photourl: map['Photourl'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(Email: $Email, Name: $Name, PhoneNo: $PhoneNo, Photourl: $Photourl, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.Email == Email &&
      other.Name == Name &&
      other.PhoneNo == PhoneNo &&
      other.Photourl == Photourl &&
      other.userId == userId;
  }

  @override
  int get hashCode {
    return Email.hashCode ^
      Name.hashCode ^
      PhoneNo.hashCode ^
      Photourl.hashCode ^
      userId.hashCode;
  }
}
