import 'package:flutter/material.dart';
import 'package:hellowork/models/Product.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color.fromARGB(255, 148, 14, 14),
                child: Column(
                  children: [
                    product.colors.isNotEmpty ? ColorDots(product: product) : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
