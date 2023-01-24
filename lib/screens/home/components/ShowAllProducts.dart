import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hellowork/models/Product.dart';
import 'package:http/http.dart' as http;

import 'product_card.dart';

class ShowAllProducts extends StatefulWidget {
  const ShowAllProducts({
    Key? key,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  State<ShowAllProducts> createState() => _ShowAllProductsState();
}

class _ShowAllProductsState extends State<ShowAllProducts> {
  Future<List<Product>> _getProduct() async {
    final response = await http.get(Uri.parse("http://192.168.0.73:3000/item"));
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      List<Product> productosS = [];
      for (var item in jsonData["items"]) {
        productosS.add(Product(id: item["_id"], image: item["image"]["path"], name: item["name"], price: "5.12", url: item["slug"], stock: item["cantidad"]));
      }
      return productosS;
    } else {
      throw Exception("fallo algo");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'TODO List',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder<List<Product>?>(
          future: _getProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    name: snapshot.data![index].name,
                    image: snapshot.data![index].image,
                    price: snapshot.data![index].price,
                    bgColor: snapshot.data![index].bgColor,
                    press: () {},
                  );
                },
              );
            }

            /// handles others as you did on question
            else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}
