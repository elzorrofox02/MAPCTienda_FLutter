import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.press,
    required this.bgColor,
  }) : super(key: key);
  final String image, name;
  final VoidCallback press;
  final String price;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    print("Build my wideg: $name");
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        height: 200,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/product_0.png',
                image: image,
                height: 132,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(color: Colors.black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: defaultPadding / 4),
                Text(
                  "\$ ${price.toString()}",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
