// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orphanage_basket_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrphanageBasketEntity _$OrphanageBasketEntityFromJson(
        Map<String, dynamic> json) =>
    OrphanageBasketEntity(
      requestId: json['request_id'] as int,
      basketProductId: json['basket_product_id'] as int,
      productName: json['product_name'] as String,
      count: json['count'] as int,
      price: json['price'] as int,
      orphanageName: json['orphanage_name'] as String,
    );

Map<String, dynamic> _$OrphanageBasketEntityToJson(
        OrphanageBasketEntity instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'basket_product_id': instance.basketProductId,
      'product_name': instance.productName,
      'count': instance.count,
      'price': instance.price,
      'orphanage_name': instance.orphanageName,
    };
