import 'dart:convert';

class RiderModel {
  String? Address;
  String? Email;
  String? Password;
  String? Phone;
  String? UserName;
  String? Imgurl;
  RiderModel({
    this.Address,
    this.Email,
    this.Password,
    this.Phone,
    this.UserName,
    this.Imgurl,
  });

  RiderModel copyWith({
    String? Address,
    String? Email,
    String? Password,
    String? Phone,
    String? UserName,
    String? Imgurl,
  }) {
    return RiderModel(
      Address: Address ?? this.Address,
      Email: Email ?? this.Email,
      Password: Password ?? this.Password,
      Phone: Phone ?? this.Phone,
      UserName: UserName ?? this.UserName,
      Imgurl: Imgurl ?? this.Imgurl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Address': Address,
      'Email': Email,
      'Password': Password,
      'Phone': Phone,
      'UserName': UserName,
      'imgurl': Imgurl,
    };
  }

  factory RiderModel.fromMap(Map<String, dynamic> map) {
    return RiderModel(
      Address: map['Address'],
      Email: map['Email'],
      Password: map['Password'],
      Phone: map['Phone'],
      UserName: map['UserName'],
      Imgurl: map['imgurl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RiderModel.fromJson(String source) =>
      RiderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RiderModel(Address: $Address, Email: $Email, Password: $Password, Phone: $Phone, UserName: $UserName, Imgurl: $Imgurl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RiderModel &&
        other.Address == Address &&
        other.Email == Email &&
        other.Password == Password &&
        other.Phone == Phone &&
        other.UserName == UserName &&
        other.Imgurl == Imgurl;
  }

  @override
  int get hashCode {
    return Address.hashCode ^
        Email.hashCode ^
        Password.hashCode ^
        Phone.hashCode ^
        UserName.hashCode ^
        Imgurl.hashCode;
  }
}
