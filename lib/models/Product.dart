import 'package:flutter/material.dart';

class Product {
  final String id, image, name, url, price;
  final String? description;
  final int stock;
  final String? qty, totalprice;

  //final dynamic optionSearch;

  final List<Color> colors;
  final List<dynamic> images;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.url,
    required this.stock,
    required this.colors,
    required this.images,
    this.qty,
    this.totalprice,
    this.description = "",
    //this.optionSearch = "",
  });

  // factory Product.fromJson(Map<String, dynamic> json) => Product(
  //       id: json['_id'],
  //       image: json['image']["path"],
  //       name: json['name'],
  //       url: json['slug'],
  //       stock: json['cantidad'],
  //       price: json['price'].toString(),
  //       colors: [],
  //       images: json['image']["fotos"],
  //       description: json["description"],
  //     );

  factory Product.fromJson(json) => Product(
        id: json['_id'],
        image: json['image']["path"],
        name: json['name'],
        url: json['slug'],
        stock: json['cantidad'],
        price: json['price'].toString(),
        colors: [],
        images: json['image']["fotos"],
        description: json["description"],
        //optionSearch: json["optionSearch"]
      );
  factory Product.fromJsonItem(json) => Product(id: json["item"]['_id'], image: json["item"]['image']["path"], name: json["item"]['name'], url: json["item"]['slug'], stock: json["item"]['cantidad'], price: json["item"]['price'].toString(), colors: [], images: json["item"]['image']["fotos"], description: json["item"]["description"], qty: json["totalQty"].toString(), totalprice: json["totalPrice"].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'url': url,
        'stock': stock,
        'price': price,
        'colors': colors,
        'images': image,
        'description': description,
      };
}

List<Product> demoProduct = [
  Product(
    id: "as456sa456asasadgdag23111112312",
    image: "https://thumb.pccomponentes.com/w-530-530/articles/15/154961/1.jpg",
    name: "Long Sleeve Shirts",
    price: "165.30",
    stock: 10,
    colors: [],
    images: [],
    url: "/item/holax",
    description: "sss",
    //optionSearch: "s",
  ),
  Product(
    id: "as456sa456asassasa112313",
    image: "https://img.pccomponentes.com/articles/82/823218/156-hp-15s-eq1140ns-amd-3020e-4gb-128gb-ssd-156.jpg",
    name: "Casual Henley Shirts",
    url: "/item/holax",
    stock: 10,
    images: [],
    colors: [],
    description: "sss",
    //optionSearch: "s",
    price: "99.30",
  ),
  Product(
    id: "as456sa456asaszxczxczxczczxczx",
    image: "https://img.pccomponentes.com/articles/82/823218/156-hp-15s-eq1140ns-amd-3020e-4gb-128gb-ssd-156.jpg",
    name: "Curved Hem Shirts",
    url: "/item/holax",
    price: "180.30",
    colors: [],
    images: [],
    description: "sss",
    //optionSearch: "s",
    stock: 10,
  ),
  Product(
    id: "as456sa412356asas123zxxzczx3123c",
    image: "https://img.pccomponentes.com/articles/82/823218/156-hp-15s-eq1140ns-amd-3020e-4gb-128gb-ssd-156.jpg",
    name: "Casual Nolin",
    url: "/item/holax",
    price: "149.30",
    colors: [],
    images: [],
    description: "sss",
    //optionSearch: "s",
    stock: 10,
  ),
];
