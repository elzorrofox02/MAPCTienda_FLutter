import 'package:flutter/material.dart';
import 'package:hellowork/constants.dart';
import 'package:hellowork/screens/profile/components/my_orders_list.dart';

class ProfileOrders extends StatefulWidget {
  const ProfileOrders({super.key});
  @override
  State<ProfileOrders> createState() => _StateprofileOrders();
}

class _StateprofileOrders extends State<ProfileOrders> {
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
                      child: const Text(
                        "5",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
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
                      child: const Text(
                        "0",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
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
                      child: const Text(
                        "0",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
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
                      child: const Text(
                        "0",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
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
                      child: const Text(
                        "0",
                        style: badgeOrden,
                      )), // icon-1
                  const Icon(Icons.chevron_right), // icon-2
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const MyListOrders(
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
                      child: const Text(
                        "0",
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
