// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String,
      img: json['img'] as String,
      price: (json['price'] as num).toDouble(),
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'price': instance.price,
      'title': instance.title,
      'description': instance.description,
    };
