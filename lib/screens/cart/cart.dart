import 'package:flutter/material.dart';
import 'package:hellowork/models/cart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:hellowork/cart_povider.dart';
import 'package:hellowork/components/default_button.dart';
import 'package:hellowork/components/image_viewer.dart';
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
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Consumer<CartProvider>(
              builder: (context, cart, child) => Text(
                cart.totalItems,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
      body: const Bodys(),
      bottomNavigationBar: const CheckoutCard(),
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
    return cart.items.isEmpty
        ? const Center(child: Text('Empty'))
        : Padding(
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
                  child: CartCard(cart: cart.items.values.toList()[index]),
                ),
              ),
            ),
          );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);
  final Mcart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(padding: EdgeInsets.all(getProportionateScreenWidth(10)), child: ImageLoads(image: cart.image)),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.name,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart.price}",
                style: const TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(text: " x${cart.qty}"),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      /* decoration: BoxDecoration(
        color: Colors.red,
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
      ), */
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                /*  const SizedBox(height: 150.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sub-total', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Colors.grey)),
                    Text('\$365.00', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping fee', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Colors.grey)),
                    Text('\$15.00', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 15.0),
                Container(width: size.width, height: 1.0, color: Colors.grey),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Payment', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.black)),
                    Text('\$380.00', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.black)),
                  ],
                ), */
                const Text("Total:"),
                const Spacer(),
                Consumer<CartProvider>(
                  builder: (context, cart, child) => Text(
                    cart.totalToPay,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Center(
              child: SizedBox(
                //width: getProportionateScreenWidth(190),
                child: DefaultButton(
                  text: "Check Out",
                  press: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
