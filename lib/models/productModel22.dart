import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductModel22 {
  String? description;
  List<String>? images;
  String? largePrice;
  String? length;
  String? mediumPrice;
  String? price;
  String? productTag;
  String? sku;
  String? smallPrice;
  String? status;
  bool? stock;
  String? storeId;
  String? title;
  String? menu;
  ProductModel22({
    this.description,
    this.images,
    this.largePrice,
    this.length,
    this.mediumPrice,
    this.price,
    this.productTag,
    this.sku,
    this.smallPrice,
    this.status,
    this.stock,
    this.storeId,
    this.title,
    this.menu,
  });

  ProductModel22 copyWith({
    String? description,
    List<String>? images,
    String? largePrice,
    String? length,
    String? mediumPrice,
    String? price,
    String? productTag,
    String? sku,
    String? smallPrice,
    String? status,
    bool? stock,
    String? storeId,
    String? title,
    String? menu,
  }) {
    return ProductModel22(
      description: description ?? this.description,
      images: images ?? this.images,
      largePrice: largePrice ?? this.largePrice,
      length: length ?? this.length,
      mediumPrice: mediumPrice ?? this.mediumPrice,
      price: price ?? this.price,
      productTag: productTag ?? this.productTag,
      sku: sku ?? this.sku,
      smallPrice: smallPrice ?? this.smallPrice,
      status: status ?? this.status,
      stock: stock ?? this.stock,
      storeId: storeId ?? this.storeId,
      title: title ?? this.title,
      menu: menu ?? this.menu,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'images': images,
      'largePrice': largePrice,
      'length': length,
      'mediumPrice': mediumPrice,
      'price': price,
      'productTag': productTag,
      'sku': sku,
      'smallPrice': smallPrice,
      'status': status,
      'stock': stock,
      'storeId': storeId,
      'title': title,
      'menu': menu,
    };
  }

  factory ProductModel22.fromMap(Map<String, dynamic> map) {
    return ProductModel22(
      description: map['description'],
      images: List<String>.from(map['images']),
      largePrice: map['largePrice'],
      length: map['length'],
      mediumPrice: map['mediumPrice'],
      price: map['price'],
      productTag: map['productTag'],
      sku: map['sku'],
      smallPrice: map['smallPrice'],
      status: map['status'],
      stock: map['stock'],
      storeId: map['storeId'],
      title: map['title'],
      menu: map['menu'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel22.fromJson(String source) =>
      ProductModel22.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel22(description: $description, images: $images, largePrice: $largePrice, length: $length, mediumPrice: $mediumPrice, price: $price, productTag: $productTag, sku: $sku, smallPrice: $smallPrice, status: $status, stock: $stock, storeId: $storeId, title: $title, menu: $menu)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel22 &&
        other.description == description &&
        listEquals(other.images, images) &&
        other.largePrice == largePrice &&
        other.length == length &&
        other.mediumPrice == mediumPrice &&
        other.price == price &&
        other.productTag == productTag &&
        other.sku == sku &&
        other.smallPrice == smallPrice &&
        other.status == status &&
        other.stock == stock &&
        other.storeId == storeId &&
        other.title == title &&
        other.menu == menu;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        images.hashCode ^
        largePrice.hashCode ^
        length.hashCode ^
        mediumPrice.hashCode ^
        price.hashCode ^
        productTag.hashCode ^
        sku.hashCode ^
        smallPrice.hashCode ^
        status.hashCode ^
        stock.hashCode ^
        storeId.hashCode ^
        title.hashCode ^
        menu.hashCode;
  }
}
