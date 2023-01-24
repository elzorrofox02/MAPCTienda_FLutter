import 'package:flutter/material.dart';
import 'package:hellowork/models/Cart.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';

import 'package:hellowork/mainProvider.dart';

import '../../constants.dart';
import '../../size_config.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Bodys(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //context.read<CartProvider>().setText(value1: "Viva españa");
          //Provider.of<CartProvider>(context, listen: false).setText(value1: "Viva españa");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: const BackButton(
        color: Colors.black, // <-- SEE HERE
      ),
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Consumer<CartProvider>(
            builder: (context, cart, child) => Text(
              cart.text1,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          /* Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ), */
        ],
      ),
    );
  }
}

class Bodys extends StatefulWidget {
  const Bodys({super.key});
  @override
  State<Bodys> createState() => _BodyState();
}

class _BodyState extends State<Bodys> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(cart.items.values.toList()[index].id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              context.read<CartProvider>().removeItem(productId: cart.items.values.toList()[index].id.toString());
              //Provider.of<CartProvider>(context, listen: false).removeItem(productId: "Viva españa");

              /* setState(() {
                demoCarts.removeAt(index);
              }); */
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/Heart.svg"),
                ],
              ),
            ),
            //child: CartCard(cart: cart.items.values.toList()[index]),
            child: CartCard(
              productId: cart.items.values.toList()[index].id,
              name: cart.items.values.toList()[index].name,
              image: cart.items.values.toList()[index].image,
              price: cart.items.values.toList()[index].price,
              qty: cart.items.values.toList()[index].qty,
              //productId: cart.items.keys.toList()[index],
            ),
          ),
        ),
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  /*  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  //final Object cart;

  final mCart cart; */

  const CartCard({Key? key, required this.name, required this.productId, required this.price, required this.image, required this.qty}) : super(key: key);

  final String name;
  final String productId;
  final String price;
  final String image;
  final int qty;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/product_0.png',
                image: image,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${price}",
                style: const TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(text: " x${qty}", style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
