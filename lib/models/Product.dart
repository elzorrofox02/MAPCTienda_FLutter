//import 'dart:ffi';

import 'package:flutter/material.dart';

class Product {
  final String id, image, name, url;
  final String price;
  final int stock;
  final Color bgColor;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.url,
    required this.stock,
    this.bgColor = const Color(0xFFEFEFF2),
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      image: json['image']["path"],
      name: json['name'],
      url: json['slug'],
      stock: json['cantidad'],
      price: json['price'].toString(),
    );
  }
}

List<Product> demo_product = [
  Product(
    id: "as456sa456asasadgdag23111112312",
    image: "https://thumb.pccomponentes.com/w-530-530/articles/15/154961/1.jpg",
    name: "Long Sleeve Shirts",
    price: "165.30",
    stock: 10,
    url: "/item/holax",
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    id: "as456sa456asassasa112313",
    image: "https://img.pccomponentes.com/articles/82/823218/156-hp-15s-eq1140ns-amd-3020e-4gb-128gb-ssd-156.jpg",
    name: "Casual Henley Shirts",
    url: "/item/holax",
    stock: 10,
    price: "99.30",
  ),
  Product(
    id: "as456sa456asaszxczxczxczczxczx",
    image: "https://img.pccomponentes.com/articles/82/823218/156-hp-15s-eq1140ns-amd-3020e-4gb-128gb-ssd-156.jpg",
    name: "Curved Hem Shirts",
    url: "/item/holax",
    price: "180.30",
    stock: 10,
    bgColor: const Color(0xFFF8FEFB),
  ),
  Product(
    id: "as456sa412356asas123zxxzczx3123c",
    image: "https://img.pccomponentes.com/articles/82/823218/156-hp-15s-eq1140ns-amd-3020e-4gb-128gb-ssd-156.jpg",
    name: "Casual Nolin",
    url: "/item/holax",
    price: "149.30",
    stock: 10,
    bgColor: const Color(0xFFEEEEED),
  ),
];
