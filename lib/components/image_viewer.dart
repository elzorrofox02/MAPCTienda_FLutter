import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageLoads extends StatelessWidget {
  const ImageLoads({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
        placeholder: 'assets/images/product_0.png',
        //image: product.image,
        image: 'assets/images/product_0.png',
        imageErrorBuilder: (context, exception, stackTrace) {
          return Container(
            width: 100.0,
            height: 100.0,
            child: SvgPicture.asset("assets/icons/Search.svg"),
          );
        });
  }
}
