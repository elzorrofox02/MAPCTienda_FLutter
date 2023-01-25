import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:hellowork/components/default_button.dart';
import '../../size_config.dart';
import 'package:hellowork/components/rounded_icon_btn.dart';
import 'package:provider/provider.dart';
import 'package:hellowork/mainProvider.dart';

class DetailsScreen2 extends StatelessWidget {
  const DetailsScreen2({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const CustomAppBar(rating: 4.2),
      ),
      body: Body(product: product),
      bottomNavigationBar: CheckoutCard(product: product),
    );
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RoundedIconBtn(
                  icon: Icons.remove,
                  press: () {},
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
                RoundedIconBtn(
                  icon: Icons.add,
                  showShadow: true,
                  press: () {},
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Center(
              child: SizedBox(
                width: getProportionateScreenWidth(190),
                child: DefaultButton(
                  text: "Check Out",
                  press: () {
                    context.read<CartProvider>().addItem(productId: product.id, price: product.price, image: product.image, name: product.name, url: product.url, stock: product.stock, qty: 1);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
