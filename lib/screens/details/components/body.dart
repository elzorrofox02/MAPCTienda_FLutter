import 'package:flutter/material.dart';
import 'package:hellowork/models/Product.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'dart:math';
import 'dart:convert';

class Body extends StatefulWidget {
  const Body({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.product.optionSearch;

    print("asssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    print("asssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    print("asssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    print("asssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    print(s.runtimeType);
    /* for (final mapEntry in s.entries) {
      final key = mapEntry.key;
      final value = mapEntry.value;
      print('Key: $key, Value: $value');
      //Text(widget.product.optionSearch.toString();// Key: a, Value: 1 ...
    } */

    List weightData = s.entries
        .map((entry) => textOptions(
              index: entry.key,
              txt: entry.value,
            ))
        .toList();

    final List<Widget> items = List.generate(
        200,
        (i) => rectangulo(
              index: i,
            ));

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          ProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color.fromARGB(255, 148, 14, 14),
                  child: Column(
                    children: [
                      widget.product.colors.isNotEmpty ? ColorDots(product: widget.product) : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ])),
        SliverAppBar(
          //title: Text("holaxx"),
          pinned: true,
          floating: true,
          //stretch: true,
          expandedHeight: 0,
          //elevation: 0,
          //snap: true,

          backgroundColor: Colors.grey,
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: Colors.black,
            indicatorColor: Colors.white,
            indicatorWeight: 2,
            isScrollable: true,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            tabs: const [
              Tab(text: 'DESCRIPCIÓN'),
              Tab(text: 'CARACTERÍSTICAS'),
              Tab(text: 'PREGUNTAS'),
              Tab(text: 'OPINIONES'),
            ],
            controller: controller,
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: controller,
            children: <Widget>[
              Center(child: Text(widget.product.description)),
              Center(
                child: Column(
                  children: List.generate(weightData.length, (index) {
                    return weightData[index];
                  }),
                ),
              ),
              Center(child: Text("Tab three")),
              Center(child: Text("Tab three")),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, i) {
          return items[i];
        }, childCount: items.length))
      ],
    );
    /* return ListView(
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
    ); */
  }
}

class textOptions extends StatelessWidget {
  const textOptions({super.key, required this.index, required this.txt});
  final String index;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$index , ", style: TextStyle(color: Colors.white)),
    );
  }
}

class rectangulo extends StatelessWidget {
  const rectangulo({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final rdn = new Random();

    final r = rdn.nextInt(255);
    final b = rdn.nextInt(255);
    final g = rdn.nextInt(255);
    // TODO: implement build
    return Container(
      child: Center(
        child: Text("hola $index", style: TextStyle(color: Colors.white)),
      ),
      width: 150,
      height: 150,
      decoration: BoxDecoration(color: Color.fromRGBO(r, g, b, 1)),
    );
  }
}

class tabsss extends StatelessWidget {
  SliverAppBar showSliverAppBar(String screenTitle) {
    return SliverAppBar(
      backgroundColor: Colors.purple,
      floating: true,
      pinned: true,
      snap: false,
      title: Text(screenTitle),
      bottom: const TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.home),
            text: 'Home',
          ),
          Tab(
            icon: Icon(Icons.settings),
            text: 'Setting',
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBarView(children: [
        // This CustomScrollView display the Home tab content
        CustomScrollView(
          slivers: [
            showSliverAppBar('Kindacode Home'),

            // Anther sliver widget: SliverList
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(
                  height: 400,
                  child: Center(
                    child: Text(
                      'Home Tab',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  height: 1500,
                  color: Colors.green,
                ),
              ]),
            ),
          ],
        ),

        // This shows the Settings tab content
        CustomScrollView(
          slivers: [
            showSliverAppBar('Settings Screen'),

            // Show other sliver stuff
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 600,
                  color: Colors.blue[200],
                  child: const Center(
                    child: Text(
                      'Settings Tab',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  height: 1200,
                  color: Colors.pink,
                ),
              ]),
            ),
          ],
        )
      ]),
    );
  }
}
