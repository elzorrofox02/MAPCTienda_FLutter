import 'package:flutter/material.dart';
import 'package:hellowork/models/orden_list.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:hellowork/constants.dart';
import 'package:hellowork/models/product.dart';
import 'package:hellowork/screens/profile/components/utilsOrdens.dart';
import 'package:hellowork/components/image_viewer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyOrdenDetail extends StatefulWidget {
  const MyOrdenDetail({
    super.key,
    required this.orden,
    //this.post
  });

  final OrdenList? orden;
  //final OrdenList? post;

  @override
  State<MyOrdenDetail> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<MyOrdenDetail> {
  OrdenList? post;

  //List<Product> items = [];

  List<Product> items = [];

  @override
  void initState() {
    super.initState();
    _getProduct();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getProduct() async {
    print(widget.orden?.id);
    final response = await http.get(Uri.parse("http://192.168.0.73:3000/auth/profile/order/${widget.orden?.id}"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZWU5MmE3N2QxMTdmNjA0OTgwOTEwYmMiLCJpYXQiOjE2NDIyMjM5MzN9.SqKdM6MQ7VO56t-AlXagYgUjLjNqYCrIdcjUmXXuVk4',
    });

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final result = OrdenListDataFromJson(response.body);
      items = result.items!;
      post = result;

      //final jsonData = jsonDecode(body);
      //var _list = jsonData["cart"].values.toList();

      setState(() {
        //items = _list.map<Product>(Product.fromJsonItem).toList();
        //post = OrdenList.fromJson(jsonData);
      });
    } else {
      print("algo pasooo");
    }
  }

  @override
  Widget build(BuildContext context) {
    final consult = OrdenUtils.status(widget.orden?.status);
    final currentStep = consult["stepe"];
    final currentStepColor = consult["number"];

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text("Orden Detalle", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.black)),
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Container(
                      child: Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffeaefff)),
                        //color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            shape: const Border(
                              bottom: BorderSide(width: 1, color: Color(0xffeaefff)),
                              //top: BorderSide(width: 1, color: Colors.grey),
                            ),
                            title: Text("${post?.id}", style: const TextStyle(fontSize: 13, color: kSecondaryColor)),
                            subtitle: Text("${post?.create}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColor)),
                            trailing: const Icon(Icons.chevron_right),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                            child: AnotherStepper(
                              stepperList: OrdenUtils.stepperData,
                              stepperDirection: Axis.horizontal,
                              gap: 20,
                              iconWidth: 25,
                              iconHeight: 25,
                              activeBarColor: Colors.green,
                              inActiveBarColor: (currentStepColor == 12 || currentStepColor == 11) ? Colors.red : Colors.grey,
                              activeIndex: currentStep,
                              barThickness: 3,
                            ),
                          ),
                          ListTile(title: const Text("Status"), visualDensity: const VisualDensity(horizontal: 0, vertical: -4), trailing: consult["action"]),
                        ],
                      ),
                    ),
                  )),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: const Text(
                          'Detalles Delivery',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            letterSpacing: 0.5,
                            color: Color(0xff223263),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffeaefff)),
                          //color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(children: [
                          ListTile(
                            title: Text(
                              "Fecha Delivery",
                              style: ordenList,
                            ),
                            trailing: Text("ayer"),
                          ),
                          ListTile(
                            title: Text(
                              "Metodo",
                              style: ordenList,
                            ),
                            trailing: Text("Post"),
                          ),
                          ListTile(
                            title: Text(
                              'Three-line ListTile',
                              style: ordenList,
                            ),
                            subtitle: Text(
                              'A sufficiently long subtitle warrants three lines.',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: kTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: Icon(Icons.location_city),
                            //isThreeLine: true,
                          ),
                          // ListTile(
                          //   title: RichText(
                          //     text: TextSpan(
                          //       children: [
                          //         const TextSpan(text: 'Direccion ', style: ordenList),
                          //         TextSpan(
                          //           text: 'jaslk djlkasjd lkjasiopd jasidji as',
                          //           style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: kTextColor),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Dirrecion",
                          //       style: ordenList,
                          //     ),
                          //     Text("Avenida presidente de venezuela luego derecha Tre asidjhoi ahjsodo ahoisdhj oiasdao hjoiashjdoi ahjsoidjh aosijhdoiasjoidj aoisjd ioasjoidj asoij oiasjoidj oi"),
                          //   ],
                          // )
                        ]),
                      )
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: const Text(
                          'Metodo de Pago',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            letterSpacing: 0.5,
                            color: Color(0xff223263),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffeaefff)),
                          //color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(children: [
                          ListTile(
                            title: Text(
                              "Metodo",
                              style: ordenList,
                            ),
                            trailing: Text("${post?.plataform}"),
                          ),
                          ListTile(
                            title: Text(
                              "Moneda",
                              style: ordenList,
                            ),
                            trailing: Text("${post?.currencyId}"),
                          ),
                          ListTile(
                            title: Text(
                              'Tarjeta',
                              style: ordenList,
                            ),

                            trailing: Text("${post?.cardLastDigits}"),
                            //isThreeLine: true,
                          ),
                          ListTile(
                            title: Text(
                              'Nombre',
                              style: ordenList,
                            ),

                            trailing: Text("${post?.cardname}"),
                            //isThreeLine: true,
                          ),
                          // ListTile(
                          //   title: RichText(
                          //     text: TextSpan(
                          //       children: [
                          //         const TextSpan(text: 'Direccion ', style: ordenList),
                          //         TextSpan(
                          //           text: 'jaslk djlkasjd lkjasiopd jasidji as',
                          //           style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: kTextColor),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Dirrecion",
                          //       style: ordenList,
                          //     ),
                          //     Text("Avenida presidente de venezuela luego derecha Tre asidjhoi ahjsodo ahoisdhj oiasdao hjoiashjdoi ahjsoidjh aosijhdoiasjoidj aoisjd ioasjoidj asoij oiasjoidj oi"),
                          //   ],
                          // )
                        ]),
                      )
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Container(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                'Resumen de Orden',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  letterSpacing: 0.5,
                                  color: Color(0xff223263),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xffeaefff)),
                                //color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    visualDensity: VisualDensity(vertical: -4), // to
                                    title: Text(
                                      "Sub-Total",
                                      style: ordenList,
                                    ),
                                    trailing: Text("652"),
                                  ),
                                  ListTile(
                                    dense: true,
                                    visualDensity: VisualDensity(vertical: -4), // to
                                    title: Text(
                                      "Descuento",
                                      style: ordenList,
                                    ),
                                    trailing: Text("50"),
                                  ),
                                  ListTile(
                                    dense: true,
                                    visualDensity: VisualDensity(vertical: -4), // to compact

                                    title: Text(
                                      'Envio',
                                      style: ordenList,
                                    ),

                                    trailing: Text("${post?.deliveryPrice}"),
                                    //isThreeLine: true,
                                  ),
                                  ListTile(
                                    dense: true,
                                    visualDensity: VisualDensity(vertical: -4), // to

                                    title: Text(
                                      'Total',
                                      style: ordenList,
                                    ),
                                    trailing: Text(
                                      "${post?.totalPrice}",
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                    //isThreeLine: true,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Container(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                'Productos',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  letterSpacing: 0.5,
                                  color: Color(0xff223263),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xffeaefff)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: items.length,

                                      //itemCount: 2,
                                      itemBuilder: (_, index) => CustomListItemTwo(
                                        // thumbnail: Container(
                                        //   decoration: const BoxDecoration(color: Colors.pink),
                                        // ),
                                        // title: "asas",
                                        // publishDate: "asasasa",
                                        // readDuration: "saasas",

                                        thumbnail: ImageLoads(
                                          image: "${items[index].image}",
                                        ),
                                        title: "${items[index].name}",
                                        publishDate: "${items[index].price}",
                                        readDuration: "${items[index].qty}",
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.publishDate,
    required this.readDuration,
  });

  final Widget thumbnail;
  final String title;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.publishDate,
    required this.readDuration,
  });

  final String title;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$publishDate - $readDuration',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
