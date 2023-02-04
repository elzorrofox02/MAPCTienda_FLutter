import 'package:flutter/material.dart';
import 'package:hellowork/models/adress_list.dart';
import 'package:hellowork/screens/address/components/address_form.dart';

import 'package:hellowork/constants.dart';

class AdressListPage extends StatefulWidget {
  const AdressListPage({Key? key}) : super(key: key);

  @override
  State<AdressListPage> createState() => _State();
}

class _State extends State<AdressListPage> {
  int _selection = 0;
  //final AdressListCard _AdressListCard = AdressListCard();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text("Direciones", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.black)),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Column(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddAddressForm()));
                    },
                    icon: const Icon(Icons.location_on),
                    label: const Text("Añadir Nueva Direccion"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 56),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ListView.builder(
                      //scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: demoAdresslist.length,
                      itemBuilder: (_, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: _selection == index ? Border.all(width: 2.0, color: colorButtonsAdd) : Border.all(width: 2.0, color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.transparent,
                        ),
                        child: RadioListTile(
                          activeColor: colorButtonsAdd,
                          value: index,
                          groupValue: _selection,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (value) {
                            setState(() {
                              _selection = index;
                            });
                          },
                          title: Text(
                            'Mi Casa',
                            style: TextStyle(
                              color: _selection == index ? colorButtonsAdd : Colors.grey,
                            ),
                          ),
                          subtitle: Text("${demoAdresslist[index].country} - ${demoAdresslist[index].estate} - ${demoAdresslist[index].city} - ${demoAdresslist[index].muni} - ${demoAdresslist[index].direction} - ${demoAdresslist[index].numero}"),
                          //secondary: const Icon(Icons.more_vert),
                          secondary: PopupMenuButton(
                            onSelected: (value) {
                              if (value == 0) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => AddAddressForm(
                                          adressListCard: demoAdresslist[index],
                                        )));
                              }

                              // _onMenuItemSelected(value as int);
                            },
                            offset: const Offset(0.0, 35),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            itemBuilder: (ctx) => [
                              PopupMenuItem(
                                value: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                    Text("Editar"),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(
                                      Icons.delete_forever,
                                      color: Colors.red,
                                    ),
                                    Text("Borrar"),
                                  ],
                                ),
                              )
                              //_buildPopupMenuItem('Editar', Icons.edit, 0),
                              //_buildPopupMenuItem('Borrar', Icons.delete, 1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  // PopupMenuItem _buildPopupMenuItem(String title, IconData iconData, int position) {
  //   return PopupMenuItem(
  //     value: position,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         Icon(
  //           iconData,
  //           color: Colors.black,
  //         ),
  //         Text(title),
  //       ],
  //     ),
  //   );
  // }
}
