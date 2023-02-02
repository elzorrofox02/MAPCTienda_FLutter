import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellowork/models/Product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              RatingBar.builder(
                itemPadding: EdgeInsets.zero,
                itemSize: 20,
                initialRating: 4, //cambiar
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                glow: false,
                ignoreGestures: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(width: 5),
              const Text("4", style: subtitleLight),
              const SizedBox(width: 5),
              const Text("(456)", style: subtitleLight)
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${product.price}", style: h1Style.copyWith(color: kPrice)),
            ],
          ),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: Container(
          //     padding: EdgeInsets.all(getProportionateScreenWidth(15)),
          //     width: getProportionateScreenWidth(64),
          //     decoration: const BoxDecoration(
          //       //color: product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
          //       color: Color(0xFFFFE6E6),
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20),
          //         bottomLeft: Radius.circular(20),
          //       ),
          //     ),
          //     child: SvgPicture.asset(
          //       "assets/icons/menu.svg",
          //       //color: product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
          //       color: const Color(0xFFFF4848),
          //       height: getProportionateScreenWidth(16),
          //     ),
          //   ),
          // ),
          Text(
            product.name,
            maxLines: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: const [
                  Text(
                    "See More Detail",
                    style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}




/* child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(color: _selectedColor == index ? colors[index] : colors[index].withOpacity(0.5), shape: BoxShape.circle),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: _selectedColor == index
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : Container(),
                            ),
                          ),
                        );
                      },
                    ), */





                    /* Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: size.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSize = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(color: _selectedSize == index ? Colors.yellow[800] : Colors.grey.shade200, shape: BoxShape.circle),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Text(
                                size[index],
                                style: TextStyle(color: _selectedSize == index ? Colors.white : Colors.black, fontSize: 15),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ), */