
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// 产品模型
class Product {

  /// 产品名称
  String name;

  /// 产品价格
  int price;

  /// 产品图片
  String image;

  /// 该产品有哪些款式
  List<ProductStyle> styles;

  /// 描述标题
  String title;

  /// 描述详情
  String description;

  /// 分类说明
  String category;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.styles,
    required this.title,
    required this.description,
    required this.category,
  });

  /// 价格格式化
  String formatPrice() {
    NumberFormat format = NumberFormat('0,000');
    return format.format(price);
  }
}

/// 款式模型
class ProductStyle {
  /// 颜色
  Color color;

  /// 颜色对应的图片
  String image;

  ProductStyle({required this.color, required this.image});
}