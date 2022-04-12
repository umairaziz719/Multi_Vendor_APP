import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class OrderModel {
  Timestamp? DateTime;
  String? MainCategory;
  Timestamp? OrderTime;
  String? StoreAddress;
  String? StoreEmail;
  String? StoreInvoiceNumber;
  StoreLatlngmap? StoreLatlng;
  String? StoreName;
  String? StoreNotes;
  String? StorePhone;
  String? StoreUid;
  String? TotalPrice;
  String? UserAddress;
  String? UserEmail;
  GeoPoint? UserLatLng;
  String? UserName;
  String? UserNotes;
  String? UserPhone;
  String? UserPhoto;
  String? Useruid;
  String? OrderId;
  String? RiderId;
  List<cartList>? cartlist;
  String? category;
  String? status;
  OrderModel({
    this.DateTime,
    this.MainCategory,
    this.OrderTime,
    this.StoreAddress,
    this.StoreEmail,
    this.StoreInvoiceNumber,
    this.StoreLatlng,
    this.StoreName,
    this.StoreNotes,
    this.StorePhone,
    this.StoreUid,
    this.TotalPrice,
    this.UserAddress,
    this.UserEmail,
    this.UserLatLng,
    this.UserName,
    this.UserNotes,
    this.UserPhone,
    this.UserPhoto,
    this.Useruid,
    this.OrderId,
    this.RiderId,
    this.cartlist,
    this.category,
    this.status,
  });

  OrderModel copyWith({
    Timestamp? DateTime,
    String? MainCategory,
    Timestamp? OrderTime,
    String? StoreAddress,
    String? StoreEmail,
    String? StoreInvoiceNumber,
    StoreLatlngmap? StoreLatlng,
    String? StoreName,
    String? StoreNotes,
    String? StorePhone,
    String? StoreUid,
    String? TotalPrice,
    String? UserAddress,
    String? UserEmail,
    GeoPoint? UserLatLng,
    String? UserName,
    String? UserNotes,
    String? UserPhone,
    String? UserPhoto,
    String? Useruid,
    String? OrderId,
    String? RiderId,
    List<cartList>? cartlist,
    String? category,
    String? status,
  }) {
    return OrderModel(
      DateTime: DateTime ?? this.DateTime,
      MainCategory: MainCategory ?? this.MainCategory,
      OrderTime: OrderTime ?? this.OrderTime,
      StoreAddress: StoreAddress ?? this.StoreAddress,
      StoreEmail: StoreEmail ?? this.StoreEmail,
      StoreInvoiceNumber: StoreInvoiceNumber ?? this.StoreInvoiceNumber,
      StoreLatlng: StoreLatlng ?? this.StoreLatlng,
      StoreName: StoreName ?? this.StoreName,
      StoreNotes: StoreNotes ?? this.StoreNotes,
      StorePhone: StorePhone ?? this.StorePhone,
      StoreUid: StoreUid ?? this.StoreUid,
      TotalPrice: TotalPrice ?? this.TotalPrice,
      UserAddress: UserAddress ?? this.UserAddress,
      UserEmail: UserEmail ?? this.UserEmail,
      UserLatLng: UserLatLng ?? this.UserLatLng,
      UserName: UserName ?? this.UserName,
      UserNotes: UserNotes ?? this.UserNotes,
      UserPhone: UserPhone ?? this.UserPhone,
      UserPhoto: UserPhoto ?? this.UserPhoto,
      Useruid: Useruid ?? this.Useruid,
      OrderId: OrderId ?? this.OrderId,
      RiderId: RiderId ?? this.RiderId,
      cartlist: cartlist ?? this.cartlist,
      category: category ?? this.category,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'DateTime': DateTime,
      'MainCategory': MainCategory,
      'OrderTime': OrderTime,
      'StoreAddress': StoreAddress,
      'StoreEmail': StoreEmail,
      'StoreInvoiceNumber': StoreInvoiceNumber,
      'StoreLatlng': StoreLatlng?.toMap(),
      'StoreName': StoreName,
      'StoreNotes': StoreNotes,
      'StorePhone': StorePhone,
      'StoreUid': StoreUid,
      'TotalPrice': TotalPrice,
      'UserAddress': UserAddress,
      'UserEmail': UserEmail,
      'UserLatLng': UserLatLng,
      'UserName': UserName,
      'UserNotes': UserNotes,
      'UserPhone': UserPhone,
      'UserPhoto': UserPhoto,
      'Useruid': Useruid,
      'OrderId': OrderId,
      'RiderId': RiderId,
      'cartlist': cartlist?.map((x) => x?.toMap())?.toList(),
      'category': category,
      'status': status,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      DateTime: map['DateTime'],
      MainCategory: map['MainCategory'],
      OrderTime: map['OrderTime'],
      StoreAddress: map['StoreAddress'],
      StoreEmail: map['StoreEmail'],
      StoreInvoiceNumber: map['StoreInvoiceNumber'],
      StoreLatlng: map['StoreLatlng'] != null
          ? StoreLatlngmap.fromMap(map['StoreLatlng'])
          : null,
      StoreName: map['StoreName'],
      StoreNotes: map['StoreNotes'],
      StorePhone: map['StorePhone'],
      StoreUid: map['StoreUid'],
      TotalPrice: map['TotalPrice'],
      UserAddress: map['UserAddress'],
      UserEmail: map['UserEmail'],
      UserLatLng: map['UserLatLng'],
      UserName: map['UserName'],
      UserNotes: map['UserNotes'],
      UserPhone: map['UserPhone'],
      UserPhoto: map['UserPhoto'],
      Useruid: map['Useruid'],
      OrderId: map['OrderId'],
      RiderId: map['RiderId'],
      cartlist: map['cartlist'] != null
          ? List<cartList>.from(
              map['cartlist']?.map((x) => cartList.fromMap(x)))
          : null,
      category: map['category'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(DateTime: $DateTime, MainCategory: $MainCategory, OrderTime: $OrderTime, StoreAddress: $StoreAddress, StoreEmail: $StoreEmail, StoreInvoiceNumber: $StoreInvoiceNumber, StoreLatlng: $StoreLatlng, StoreName: $StoreName, StoreNotes: $StoreNotes, StorePhone: $StorePhone, StoreUid: $StoreUid, TotalPrice: $TotalPrice, UserAddress: $UserAddress, UserEmail: $UserEmail, UserLatLng: $UserLatLng, UserName: $UserName, UserNotes: $UserNotes, UserPhone: $UserPhone, UserPhoto: $UserPhoto, Useruid: $Useruid, OrderId: $OrderId, RiderId: $RiderId, cartlist: $cartlist, category: $category, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.DateTime == DateTime &&
        other.MainCategory == MainCategory &&
        other.OrderTime == OrderTime &&
        other.StoreAddress == StoreAddress &&
        other.StoreEmail == StoreEmail &&
        other.StoreInvoiceNumber == StoreInvoiceNumber &&
        other.StoreLatlng == StoreLatlng &&
        other.StoreName == StoreName &&
        other.StoreNotes == StoreNotes &&
        other.StorePhone == StorePhone &&
        other.StoreUid == StoreUid &&
        other.TotalPrice == TotalPrice &&
        other.UserAddress == UserAddress &&
        other.UserEmail == UserEmail &&
        other.UserLatLng == UserLatLng &&
        other.UserName == UserName &&
        other.UserNotes == UserNotes &&
        other.UserPhone == UserPhone &&
        other.UserPhoto == UserPhoto &&
        other.Useruid == Useruid &&
        other.OrderId == OrderId &&
        other.RiderId == RiderId &&
        listEquals(other.cartlist, cartlist) &&
        other.category == category &&
        other.status == status;
  }

  @override
  int get hashCode {
    return DateTime.hashCode ^
        MainCategory.hashCode ^
        OrderTime.hashCode ^
        StoreAddress.hashCode ^
        StoreEmail.hashCode ^
        StoreInvoiceNumber.hashCode ^
        StoreLatlng.hashCode ^
        StoreName.hashCode ^
        StoreNotes.hashCode ^
        StorePhone.hashCode ^
        StoreUid.hashCode ^
        TotalPrice.hashCode ^
        UserAddress.hashCode ^
        UserEmail.hashCode ^
        UserLatLng.hashCode ^
        UserName.hashCode ^
        UserNotes.hashCode ^
        UserPhone.hashCode ^
        UserPhoto.hashCode ^
        Useruid.hashCode ^
        OrderId.hashCode ^
        RiderId.hashCode ^
        cartlist.hashCode ^
        category.hashCode ^
        status.hashCode;
  }
}

class StoreLatlngmap {
  String? geohash;
  GeoPoint? geopoint;

  StoreLatlngmap({
    this.geohash,
    this.geopoint,
  });

  StoreLatlngmap copyWith({
    String? geohash,
    GeoPoint? geopoint,
  }) {
    return StoreLatlngmap(
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

  factory StoreLatlngmap.fromMap(Map<String, dynamic> map) {
    return StoreLatlngmap(
      geohash: map['geohash'],
      geopoint: map['geopoint'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreLatlngmap.fromJson(String source) =>
      StoreLatlngmap.fromMap(json.decode(source));

  @override
  String toString() => 'StoreLatlngmap(geohash: $geohash, geopoint: $geopoint)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StoreLatlngmap &&
        other.geohash == geohash &&
        other.geopoint == geopoint;
  }

  @override
  int get hashCode => geohash.hashCode ^ geopoint.hashCode;
}

class cartList {
  int? color;
  String? size;
  String? image;
  String? name;
  String? price;
  int? quantity;
  cartList({
    this.color,
    this.size,
    this.image,
    this.name,
    this.price,
    this.quantity,
  });

  cartList copyWith({
    int? color,
    String? size,
    String? image,
    String? name,
    String? price,
    int? quantity,
  }) {
    return cartList(
      color: color != null ? color : 0,
      size: size != null ? size : "",
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'color': color,
      'size': size,
      'image': image,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory cartList.fromMap(Map<String, dynamic> map) {
    return cartList(
      color: map['color'] != null ? map['color'] : 0,
      size: map['size'] != null ? map['size'] : "",
      image: map['image'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory cartList.fromJson(String source) =>
      cartList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'cartList(color: $color, size: $size, image: $image, name: $name, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is cartList &&
        other.color == color &&
        other.size == size &&
        other.image == image &&
        other.name == name &&
        other.price == price &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        size.hashCode ^
        image.hashCode ^
        name.hashCode ^
        price.hashCode ^
        quantity.hashCode;
  }
}
