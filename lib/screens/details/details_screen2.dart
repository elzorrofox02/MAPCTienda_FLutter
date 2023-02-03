import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:hellowork/components/default_button.dart';
import '../../size_config.dart';
//import 'package:hellowork/components/rounded_icon_btn.dart';
import 'package:provider/provider.dart';
import 'package:hellowork/cart_povider.dart';
import 'package:hellowork/constants.dart';

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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          // Respond to button press
        },
        icon: const Icon(Icons.add),
        label: const Text('Check out'),
      ),
      // floatingActionButton: GestureDetector(
      //   onTap: () => {},
      //   child: Container(
      //     height: 50,
      //     width: 200,
      //     decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
      //     alignment: Alignment.center,
      //     child: const Text(
      //       "Check out",
      //       style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      //     ),
      // ),
      //),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // //bottomNavigationBar: CheckoutCard(product: product),
    );
  }
}

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  int counter = 1;

  void add() {
    if (counter < widget.product.stock) {
      setState(() {
        counter++;
      });
    }
  }

  void remove() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 2, bottom: 2, right: 2, left: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(children: [
              IconButton(
                iconSize: 20,
                onPressed: () {
                  remove();
                },
                icon: const Icon(
                  Icons.remove,
                ),
              ),
              //SizedBox(width: getProportionateScreenWidth(10)),
              Text(counter.toString()),
              IconButton(
                iconSize: 20,
                onPressed: () {
                  add();
                },
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ]),
          ),
          SizedBox(
            width: getProportionateScreenWidth(190),
            child: DefaultButton(
              text: "Check Out",
              press: () {
                context.read<CartProvider>().addItem(productId: widget.product.id, price: widget.product.price, image: widget.product.image, name: widget.product.name, url: widget.product.url, stock: widget.product.stock, qty: counter);
              },
            ),
          ),
        ],
      ),
    );
  }
}
