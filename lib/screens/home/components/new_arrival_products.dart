import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hellowork/models/Product.dart';

import 'package:http/http.dart' as http;

import '../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';
import 'ShowAllProducts.dart';

class NewArrivalProducts extends StatefulWidget {
  const NewArrivalProducts({
    Key? key,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _NewArrivalProductsState createState() => _NewArrivalProductsState();
}

class _NewArrivalProductsState extends State<NewArrivalProducts> {
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

      //return jsonData["items"].map((data) => Product.fromJson(data)).toList();
      //return jsonData["items"].map((dynamic e) => Product.fromJson(e)).toList();
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "New Arrival",
            pressSeeAll: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowAllProducts(),
                  ));
            },
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<List<Product>>(
            future: _getProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                return Row(
                    children: List.generate(
                  snapshot.data!.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: defaultPadding),
                    child: ProductCard(
                      name: snapshot.data![index].name,
                      image: snapshot.data![index].image,
                      price: snapshot.data![index].price,
                      bgColor: snapshot.data![index].bgColor,
                      press: () {
                        /* setState(() {
                          demo_product.remove(demo_product[index]);
                        }); */
                        //Navigator.push(context,MaterialPageRoute(builder: (context) => DetailsScreen(product: demo_product[index]),));
                      },
                    ),
                  ),
                ));
              } else if (snapshot.hasError) {
                return const Text("errroor");
              }
              return const Text("Cargando...");
            },
          ),
        )
      ],
    );
  }
}
