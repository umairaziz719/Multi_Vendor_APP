import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductModel {
  List<int>? colors;
  bool? dangerous;
  String? description;
  String? height;
  List<String>? images;

  String? largePrice;
  String? length;
  String? mediumPrice;
  String? price;
  String? productTag;
  String? sellPrice;
  Timestamp? sellPriceDuration;
  String? sku;
  String? smallPrice;
  String? status;
  bool? stock;
  String? storeId;
  String? title;
  bool? warranty;
  String? weight;
  String? width;

  ProductModel({
    this.colors,
    this.dangerous,
    this.description,
    this.height,
    this.images,
    this.largePrice,
    this.length,
    this.mediumPrice,
    this.price,
    this.productTag,
    this.sellPrice,
    this.sellPriceDuration,
    this.sku,
    this.smallPrice,
    this.status,
    this.stock,
    this.storeId,
    this.title,
    this.warranty,
    this.weight,
    this.width,
  });

  ProductModel copyWith({
    List<int>? colors,
    bool? dangerous,
    String? description,
    String? height,
    List<String>? images,
    String? largePrice,
    String? length,
    String? mediumPrice,
    String? price,
    String? productTag,
    String? sellPrice,
    Timestamp? sellPriceDuration,
    String? sku,
    String? smallPrice,
    String? status,
    bool? stock,
    String? storeId,
    String? title,
    bool? warranty,
    String? weight,
    String? width,
  }) {
    return ProductModel(
      colors: colors ?? this.colors,
      dangerous: dangerous ?? this.dangerous,
      description: description ?? this.description,
      height: height ?? this.height,
      images: images ?? this.images,
      largePrice: largePrice ?? this.largePrice,
      length: length ?? this.length,
      mediumPrice: mediumPrice ?? this.mediumPrice,
      price: price ?? this.price,
      productTag: productTag ?? this.productTag,
      sellPrice: sellPrice ?? this.sellPrice,
      sellPriceDuration: sellPriceDuration ?? this.sellPriceDuration,
      sku: sku ?? this.sku,
      smallPrice: smallPrice ?? this.smallPrice,
      status: status ?? this.status,
      stock: stock ?? this.stock,
      storeId: storeId ?? this.storeId,
      title: title ?? this.title,
      warranty: warranty ?? this.warranty,
      weight: weight ?? this.weight,
      width: width ?? this.width,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'colors': colors,
      'dangerous': dangerous,
      'description': description,
      'height': height,
      'images': images,
      'largePrice': largePrice,
      'length': length,
      'mediumPrice': mediumPrice,
      'price': price,
      'productTag': productTag,
      'sellPrice': sellPrice,
      'sellPriceDuration': sellPriceDuration,
      'sku': sku,
      'smallPrice': smallPrice,
      'status': status,
      'stock': stock,
      'storeId': storeId,
      'title': title,
      'warranty': warranty,
      'weight': weight,
      'width': width,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      colors: List<int>.from(map['colors']),
      dangerous: map['dangerous'],
      description: map['description'],
      height: map['height'],
      images: List<String>.from(map['images']),
      largePrice: map['largePrice'],
      length: map['length'],
      mediumPrice: map['mediumPrice'],
      price: map['price'],
      productTag: map['productTag'],
      sellPrice: map['sellPrice'],
      sellPriceDuration: map['sellPriceDuration'],
      sku: map['sku'],
      smallPrice: map['smallPrice'],
      status: map['status'],
      stock: map['stock'],
      storeId: map['storeId'],
      title: map['title'],
      warranty: map['warranty'],
      weight: map['weight'],
      width: map['width'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(colors: $colors, dangerous: $dangerous, description: $description, height: $height, images: $images, largePrice: $largePrice, length: $length, mediumPrice: $mediumPrice, price: $price, productTag: $productTag, sellPrice: $sellPrice, sellPriceDuration: $sellPriceDuration, sku: $sku, smallPrice: $smallPrice, status: $status, stock: $stock, storeId: $storeId, title: $title, warranty: $warranty, weight: $weight, width: $width)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        listEquals(other.colors, colors) &&
        other.dangerous == dangerous &&
        other.description == description &&
        other.height == height &&
        listEquals(other.images, images) &&
        other.largePrice == largePrice &&
        other.length == length &&
        other.mediumPrice == mediumPrice &&
        other.price == price &&
        other.productTag == productTag &&
        other.sellPrice == sellPrice &&
        other.sellPriceDuration == sellPriceDuration &&
        other.sku == sku &&
        other.smallPrice == smallPrice &&
        other.status == status &&
        other.stock == stock &&
        other.storeId == storeId &&
        other.title == title &&
        other.warranty == warranty &&
        other.weight == weight &&
        other.width == width;
  }

  @override
  int get hashCode {
    return colors.hashCode ^
        dangerous.hashCode ^
        description.hashCode ^
        height.hashCode ^
        images.hashCode ^
        largePrice.hashCode ^
        length.hashCode ^
        mediumPrice.hashCode ^
        price.hashCode ^
        productTag.hashCode ^
        sellPrice.hashCode ^
        sellPriceDuration.hashCode ^
        sku.hashCode ^
        smallPrice.hashCode ^
        status.hashCode ^
        stock.hashCode ^
        storeId.hashCode ^
        title.hashCode ^
        warranty.hashCode ^
        weight.hashCode ^
        width.hashCode;
  }
}
