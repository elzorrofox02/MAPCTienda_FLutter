import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hellowork/models/product.dart';
//import 'package:hellowork/screens/details/details_screen.dart';

import '../../../constants.dart';
//import 'product_card.dart';
import 'product_card2.dart';
import 'section_title.dart';
import 'show_all_products.dart';

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
      final jsonData = jsonDecode(body)?["items"];

      if (jsonData == null) return [];

      return jsonData.map<Product>(Product.fromJson).toList();

      //List<Product> users = jsonData.map((l) => Product.fromMap(l)).toList();
    } else {
      return [];
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
                  (index) => Padding(padding: const EdgeInsets.only(right: defaultPadding), child: ProductCard2(product: snapshot.data![index])),
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
