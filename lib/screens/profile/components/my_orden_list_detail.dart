import 'package:flutter/material.dart';
import 'package:hellowork/models/orden_list.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:hellowork/constants.dart';
//import 'package:hellowork/models/product.dart';
import 'package:hellowork/screens/profile/components/utils_ordens.dart';
import 'package:hellowork/components/image_viewer.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;

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
  //OrdenList? post;

  //List<Product> items = [];

  //List<Product> items = [];

  @override
  void initState() {
    super.initState();
    //_getProduct();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final envio = widget.orden?.envio;
    final plataform = envio?.plataform;
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Container(
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
                            title: Text("${widget.orden?.id}", style: const TextStyle(fontSize: 13, color: kSecondaryColor)),
                            subtitle: Text("${widget.orden?.create}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColor)),
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
                  ),
                  (plataform != null && plataform != "null")
                      ? Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4), // to
                              title: const Text(
                                "Detalle Entrega",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  letterSpacing: 0.5,
                                  color: Color(0xff223263),
                                ),
                              ),
                              trailing: currentStep <= 3 ? const Text("Cambiar") : Container(),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xffeaefff)),
                                //color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(children: [
                                const ListTile(
                                  title: Text(
                                    "Fecha",
                                    style: ordenList,
                                  ),
                                  trailing: Text("ayer"),
                                ),
                                ListTile(
                                  title: const Text(
                                    "Metodo",
                                    style: ordenList,
                                  ),
                                  trailing: Text("${OrdenUtils.method(envio)["mth"]}"),
                                ),
                                plataform == "province"
                                    ? ListTile(
                                        title: const Text(
                                          'Dirrecion',
                                          style: ordenList,
                                        ),
                                        subtitle: Text(
                                          '${envio?.province?.country}, ${envio?.province?.city}, ${envio?.province?.province}, ${envio?.province?.distrit}, ${envio?.metdirection?.direction},${envio?.metdirection?.number},${envio?.metdirection?.piso},${envio?.metdirection?.reference}',
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        trailing: const Icon(Icons.location_city),
                                        //isThreeLine: true,
                                      )
                                    : Container(),
                                plataform == "express"
                                    ? ListTile(
                                        title: const Text(
                                          'Dirrecion',
                                          style: ordenList,
                                        ),
                                        subtitle: Text(
                                          '${envio?.express?.diretionmaps},${envio?.express?.lanlong} ,${envio?.metdirection?.direction},${envio?.metdirection?.number},${envio?.metdirection?.piso},${envio?.metdirection?.reference}',
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        trailing: const Icon(Icons.location_city),
                                        //isThreeLine: true,
                                      )
                                    : Container(),
                                plataform == "shop"
                                    ? const ListTile(
                                        title: Text(
                                          'Dirrecion',
                                          style: ordenList,
                                        ),
                                        subtitle: Text(
                                          'La isabelica Sector 1, casa 2',
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        trailing: Icon(Icons.location_city),
                                        //isThreeLine: true,
                                      )
                                    : Container(),
                                ListTile(
                                  title: const Text(
                                    'Receptor',
                                    style: ordenList,
                                  ),
                                  subtitle: Text(
                                    '${envio?.dataName} ${envio?.datalastname},${envio?.dataDocType}-${envio?.dataDocNumber}',
                                    style: const TextStyle(
                                      fontSize: 13.0,
                                      color: kTextColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  trailing: const Icon(Icons.location_city),
                                  //isThreeLine: true,
                                ),
                                (envio?.dataConctaperson != null && envio?.dataConctaperson != "")
                                    ? ListTile(
                                        title: const Text(
                                          'Receptor 2',
                                          style: ordenList,
                                        ),
                                        subtitle: Text(
                                          '${envio?.dataConctaperson} ${envio?.dataPhone}',
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        trailing: const Icon(Icons.location_city),
                                        //isThreeLine: true,
                                      )
                                    : Container(),
                                (envio?.dataInstruccion != null && envio?.dataInstruccion != "")
                                    ? ListTile(
                                        title: const Text(
                                          'Instrucciones',
                                          style: ordenList,
                                        ),
                                        subtitle: Text(
                                          '${envio?.dataName} ${envio?.datalastname},${envio?.dataDocType}-${envio?.dataDocNumber}',
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        trailing: const Icon(Icons.location_city),
                                        //isThreeLine: true,
                                      )
                                    : Container(),
                              ]),
                            )
                          ]),
                        )
                      : Container(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
                            title: const Text(
                              "Metodo",
                              style: ordenList,
                            ),
                            trailing: Text("${widget.orden?.plataform}"),
                          ),
                          ListTile(
                            title: const Text(
                              "Moneda",
                              style: ordenList,
                            ),
                            trailing: Text("${widget.orden?.currencyId}"),
                          ),
                          ListTile(
                            title: const Text(
                              'Tarjeta',
                              style: ordenList,
                            ),

                            trailing: Text("${widget.orden?.cardLastDigits}"),
                            //isThreeLine: true,
                          ),
                          ListTile(
                            title: const Text(
                              'Nombre',
                              style: ordenList,
                            ),

                            trailing: Text("${widget.orden?.cardname}"),
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
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
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
                                const ListTile(
                                  dense: true,
                                  visualDensity: VisualDensity(vertical: -4), // to
                                  title: Text(
                                    "Sub-Total",
                                    style: ordenList,
                                  ),
                                  trailing: Text("652"),
                                ),
                                const ListTile(
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
                                  visualDensity: const VisualDensity(vertical: -4), // to compact

                                  title: const Text(
                                    'Envio',
                                    style: ordenList,
                                  ),

                                  trailing: Text("${widget.orden?.deliveryPrice}"),
                                  //isThreeLine: true,
                                ),
                                ListTile(
                                  dense: true,
                                  visualDensity: const VisualDensity(vertical: -4), // to

                                  title: const Text(
                                    'Total',
                                    style: ordenList,
                                  ),
                                  trailing: Text(
                                    "${widget.orden?.totalPrice}",
                                    style: const TextStyle(color: kPrimaryColor),
                                  ),
                                  //isThreeLine: true,
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    itemCount: widget.orden?.items?.length,

                                    //itemCount: 2,
                                    itemBuilder: (_, index) => CustomListItemTwo(
                                      // thumbnail: Container(
                                      //   decoration: const BoxDecoration(color: Colors.pink),
                                      // ),
                                      // title: "asas",
                                      // publishDate: "asasasa",
                                      // readDuration: "saasas",

                                      thumbnail: ImageLoads(
                                        image: "${widget.orden?.items?[index].image}",
                                      ),
                                      title: "${widget.orden?.items?[index].name}",
                                      publishDate: "${widget.orden?.items?[index].price}",
                                      readDuration: "${widget.orden?.items?[index].qty}",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class Shipping extends StatelessWidget {
  const Shipping({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
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
