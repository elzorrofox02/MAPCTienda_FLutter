import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hellowork/models/product.dart';
import 'package:http/http.dart' as http;

import 'product_card.dart';

class ShowAllProducts extends StatefulWidget {
  const ShowAllProducts({
    Key? key,
  }) : super(key: key);
  @override
  State<ShowAllProducts> createState() => _ShowAllProductsState();
}

class _ShowAllProductsState extends State<ShowAllProducts> {
  final scrollController = ScrollController();

  bool isLoadingMore = false;
  bool hasMore = true;
  List<Product> post = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollController);
    _getProduct();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> _getProduct() async {
    const limit = 20;
    final response = await http.get(Uri.parse("http://192.168.0.73:3000/search?q=televisor&page=$page"));
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body)?["items"];

      setState(() {
        if (jsonData == null) hasMore = false;

        isLoadingMore = false;
        post = post + jsonData.map<Product>(Product.fromJson).toList();
        page++;

        if (jsonData.length < limit) {
          hasMore = false;
        }
      });
    } else {
      throw Exception("fallo algo");
    }
  }

  Future<void> _scrollController() async {
    if (isLoadingMore) return;
    if (!hasMore) return;
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMore = true;
      });
      await _getProduct();
    }
  }

  Future refresh() async {
    setState(() {
      isLoadingMore = false;
      hasMore = true;
      page = 1;
      post.clear();
    });
    _getProduct();
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
        body: RefreshIndicator(
          onRefresh: refresh,
          child: GridView.builder(
              controller: scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: post.length + 1,
              itemBuilder: (context, index) {
                if (index < post.length) {
                  //return Text(post[index].name);
                  return ProductCard(
                    product: post[index],
                    press: () {},
                  );
                } else {
                  return Center(child: hasMore ? const CircularProgressIndicator() : const Text("No hay mas Resultados"));
                }
              }),
        ));
  }
}
