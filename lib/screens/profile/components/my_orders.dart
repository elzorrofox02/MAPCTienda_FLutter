import 'package:flutter/material.dart';
import 'package:hellowork/constants.dart';
import 'package:hellowork/screens/profile/components/my_orders_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hellowork/models/orden_list.dart';

class ProfileOrders extends StatefulWidget {
  const ProfileOrders({super.key});
  @override
  State<ProfileOrders> createState() => _StateprofileOrders();
}

class _StateprofileOrders extends State<ProfileOrders> {
  OrdenCount? count;

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
    final response = await http.get(Uri.parse("http://192.168.0.73:3000/auth/profile/order/"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZWU5MmE3N2QxMTdmNjA0OTgwOTEwYmMiLCJpYXQiOjE2NDIyMjM5MzN9.SqKdM6MQ7VO56t-AlXagYgUjLjNqYCrIdcjUmXXuVk4',
    });

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      setState(() {
        count = OrdenCount.fromJson(jsonData);
      });
    } else {
      print("algo pasooo");
    }
  }

  @override
  Widget build(BuildContext context) {
    //final size = SizeConfig.getSize(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text("Ordenes", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.black)),
        ),
        body: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
                        status: 9,
                        typeLoad: "finish",
                      ))),
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.event_available),
              title: const Text('Completadas'),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                //alignment: WrapAlignment.center,
                //runAlignment: WrapAlignment.center,
                spacing: 0, // space between two icons
                children: <Widget>[
                  Container(
                      //color: Colors.green,
                      padding: paddiOrden,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        "${count?.finish}",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
                        status: 7,
                        typeLoad: "packet",
                      ))),
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.badge),
              title: const Text('Recoletando'),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 0, // space between two icons
                children: <Widget>[
                  Container(
                      //color: Colors.green,
                      padding: paddiOrden,
                      decoration: BoxDecoration(
                        color: colorButtonsAdd,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        "${count?.packet}",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
                        status: 3,
                        typeLoad: "pendient_payment",
                      ))),
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Pendiente en Pagar'),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 0, // space between two icons
                children: <Widget>[
                  Container(
                      //color: Colors.green,
                      padding: paddiOrden,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 210, 6),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        "${count?.pendient}",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
                        status: 4,
                        typeLoad: "processing_payment",
                      ))),
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.work_history),
              title: const Text('Procesando Pago'),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 0, // space between two icons
                children: <Widget>[
                  Container(
                      //color: Colors.green,
                      padding: paddiOrden,
                      decoration: BoxDecoration(
                        color: colorButtonsAdd,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        "${count?.processing}",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
                        status: 8,
                        typeLoad: "shipped",
                      ))),
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.local_shipping),
              title: const Text('Delivery'),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 0, // space between two icons
                children: <Widget>[
                  Container(
                      //color: Colors.green,
                      padding: paddiOrden,
                      decoration: BoxDecoration(
                        color: colorButtonsAdd,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        "${count?.shipped}",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
                        status: 6,
                        typeLoad: "cart",
                      ))),
              horizontalTitleGap: 0.0,
              leading: const Icon(Icons.shopping_cart),
              title: const Text('En Carrito'),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 0, // space between two icons
                children: <Widget>[
                  Container(
                      //color: Colors.green,
                      padding: paddiOrden,
                      decoration: BoxDecoration(
                        color: colorButtonsAdd,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        "${count?.bag}",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
                        status: 5,
                        typeLoad: "cancel",
                      ))),
              horizontalTitleGap: 0.0,
              leading: const Icon(
                Icons.cancel,
              ),
              title: const Text('Cancelada'),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 0, // space between two icons
                children: <Widget>[
                  Container(
                      //color: Colors.green,
                      padding: paddiOrden,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        "${count?.totalcancel}",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
          ]).toList(),
        ));
  }
}
