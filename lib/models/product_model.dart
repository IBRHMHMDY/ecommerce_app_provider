import 'package:flutter/material.dart';

class ProductModel {
  final int id;
  final String title;
  final String category;
  final String image;
  final String description;
  final double price;
  final double rating;
  final String review;
  final List<Color> colors;
  int quantity;

  ProductModel({
    required this.id,
    required this.title,
    required this.category,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
    required this.review,
    required this.colors,
    required this.quantity
  });
}
