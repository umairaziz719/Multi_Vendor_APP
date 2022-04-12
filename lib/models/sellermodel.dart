import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class SellerModel {
  String? address;
  bool? bank;
  String? bankAccName;
  String? bankAccNum;
  String? bankName;
  String? cheque;
  String? cover;
  String? email;
  StoresssLatlngmap? geoLocation;

  String? idCard;
  String? idCardBack;
  String? idCardFront;
  bool? identification;
  String? image;
  bool? location;
  String? logo;
  String? mainCategory;
  String? ownerName;
  String? phone;
  String? status;
  bool? storeDetails;
  String? storeName;

  String? storeTag;
  List<String>? tags;
  String? uid;

  
  SellerModel({
    this.address,
    this.bank,
    this.bankAccName,
    this.bankAccNum,
    this.bankName,
    this.cheque,
    this.cover,
    this.email,
    this.geoLocation,
    this.idCard,
    this.idCardBack,
    this.idCardFront,
    this.identification,
    this.image,
    this.location,
    this.logo,
    this.mainCategory,
    this.ownerName,
    this.phone,
    this.status,
    this.storeDetails,
    this.storeName,
    this.storeTag,
    this.tags,
    this.uid,
  });

  SellerModel copyWith({
    String? address,
    bool? bank,
    String? bankAccName,
    String? bankAccNum,
    String? bankName,
    String? cheque,
    String? cover,
    String? email,
    StoresssLatlngmap? geoLocation,
    String? idCard,
    String? idCardBack,
    String? idCardFront,
    bool? identification,
    String? image,
    bool? location,
    String? logo,
    String? mainCategory,
    String? ownerName,
    String? phone,
    String? status,
    bool? storeDetails,
    String? storeName,
    String? storeTag,
    List<String>? tags,
    String? uid,
  }) {
    return SellerModel(
      address: address ?? this.address,
      bank: bank ?? this.bank,
      bankAccName: bankAccName ?? this.bankAccName,
      bankAccNum: bankAccNum ?? this.bankAccNum,
      bankName: bankName ?? this.bankName,
      cheque: cheque ?? this.cheque,
      cover: cover ?? this.cover,
      email: email ?? this.email,
      geoLocation: geoLocation ?? this.geoLocation,
      idCard: idCard ?? this.idCard,
      idCardBack: idCardBack ?? this.idCardBack,
      idCardFront: idCardFront ?? this.idCardFront,
      identification: identification ?? this.identification,
      image: image ?? this.image,
      location: location ?? this.location,
      logo: logo ?? this.logo,
      mainCategory: mainCategory ?? this.mainCategory,
      ownerName: ownerName ?? this.ownerName,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      storeDetails: storeDetails ?? this.storeDetails,
      storeName: storeName ?? this.storeName,
      storeTag: storeTag ?? this.storeTag,
      tags: tags ?? this.tags,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'bank': bank,
      'bankAccName': bankAccName,
      'bankAccNum': bankAccNum,
      'bankName': bankName,
      'cheque': cheque,
      'cover': cover,
      'email': email,
      'geoLocation': geoLocation?.toMap(),
      'idCard': idCard,
      'idCardBack': idCardBack,
      'idCardFront': idCardFront,
      'identification': identification,
      'image': image,
      'location': location,
      'logo': logo,
      'mainCategory': mainCategory,
      'ownerName': ownerName,
      'phone': phone,
      'status': status,
      'storeDetails': storeDetails,
      'storeName': storeName,
      'storeTag': storeTag,
      'tags': tags,
      'uid': uid,
    };
  }

  factory SellerModel.fromMap(Map<String, dynamic> map) {
    return SellerModel(
      address: map['address'],
      bank: map['bank'],
      bankAccName: map['bankAccName'],
      bankAccNum: map['bankAccNum'],
      bankName: map['bankName'],
      cheque: map['cheque'],
      cover: map['cover'],
      email: map['email'],
      geoLocation: map['geoLocation'] != null
          ? StoresssLatlngmap.fromMap(map['geoLocation'])
          : null,
      idCard: map['idCard'],
      idCardBack: map['idCardBack'],
      idCardFront: map['idCardFront'],
      identification: map['identification'],
      image: map['image'],
      location: map['location'],
      logo: map['logo'],
      mainCategory: map['mainCategory'],
      ownerName: map['ownerName'],
      phone: map['phone'],
      status: map['status'],
      storeDetails: map['storeDetails'],
      storeName: map['storeName'],
      storeTag: map['storeTag'],
      tags: List<String>.from(map['tags']),
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SellerModel.fromJson(String source) =>
      SellerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SellerModel(address: $address, bank: $bank, bankAccName: $bankAccName, bankAccNum: $bankAccNum, bankName: $bankName, cheque: $cheque, cover: $cover, email: $email, geoLocation: $geoLocation, idCard: $idCard, idCardBack: $idCardBack, idCardFront: $idCardFront, identification: $identification, image: $image, location: $location, logo: $logo, mainCategory: $mainCategory, ownerName: $ownerName, phone: $phone, status: $status, storeDetails: $storeDetails, storeName: $storeName, storeTag: $storeTag, tags: $tags, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SellerModel &&
        other.address == address &&
        other.bank == bank &&
        other.bankAccName == bankAccName &&
        other.bankAccNum == bankAccNum &&
        other.bankName == bankName &&
        other.cheque == cheque &&
        other.cover == cover &&
        other.email == email &&
        other.geoLocation == geoLocation &&
        other.idCard == idCard &&
        other.idCardBack == idCardBack &&
        other.idCardFront == idCardFront &&
        other.identification == identification &&
        other.image == image &&
        other.location == location &&
        other.logo == logo &&
        other.mainCategory == mainCategory &&
        other.ownerName == ownerName &&
        other.phone == phone &&
        other.status == status &&
        other.storeDetails == storeDetails &&
        other.storeName == storeName &&
        other.storeTag == storeTag &&
        listEquals(other.tags, tags) &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        bank.hashCode ^
        bankAccName.hashCode ^
        bankAccNum.hashCode ^
        bankName.hashCode ^
        cheque.hashCode ^
        cover.hashCode ^
        email.hashCode ^
        geoLocation.hashCode ^
        idCard.hashCode ^
        idCardBack.hashCode ^
        idCardFront.hashCode ^
        identification.hashCode ^
        image.hashCode ^
        location.hashCode ^
        logo.hashCode ^
        mainCategory.hashCode ^
        ownerName.hashCode ^
        phone.hashCode ^
        status.hashCode ^
        storeDetails.hashCode ^
        storeName.hashCode ^
        storeTag.hashCode ^
        tags.hashCode ^
        uid.hashCode;
  }
}

class StoresssLatlngmap {
  String? geohash;
  GeoPoint? geopoint;

  StoresssLatlngmap({
    this.geohash,
    this.geopoint,
  });

  StoresssLatlngmap copyWith({
    String? geohash,
    GeoPoint? geopoint,
  }) {
    return StoresssLatlngmap(
      geohash: geohash ?? this.geohash,
      geopoint: geopoint ?? this.geopoint,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'geohash': geohash,
      'geopoint': geopoint,
    };
  }

  factory StoresssLatlngmap.fromMap(Map<String, dynamic> map) {
    return StoresssLatlngmap(
      geohash: map['geohash'],
      geopoint: map['geopoint'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoresssLatlngmap.fromJson(String source) =>
      StoresssLatlngmap.fromMap(json.decode(source));

  @override
  String toString() => 'StoreLatlngmap(geohash: $geohash, geopoint: $geopoint)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StoresssLatlngmap &&
        other.geohash == geohash &&
        other.geopoint == geopoint;
  }

  @override
  int get hashCode => geohash.hashCode ^ geopoint.hashCode;
}
