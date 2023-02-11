import 'package:flutter/material.dart';
import 'package:hellowork/constants.dart';
import 'package:hellowork/models/list_card.dart';

import 'package:hellowork/screens/payment/components/add_new_card.dart';

class ListCardScreen extends StatefulWidget {
  const ListCardScreen({Key? key}) : super(key: key);

  @override
  State<ListCardScreen> createState() => _ListCardScreen();
}

class _ListCardScreen extends State<ListCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "Mis Tarjetas",
          style: TextStyle(color: darkGrey),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                child: ListView.builder(
                  //scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: demoListCard.length,
                  itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: GestureDetector(
                          //behavior: HitTestBehavior.translucent,
                          onTap: () {},
                          child: Container(
                              width: 48,
                              height: 48,
                              //padding: const EdgeInsets.symmetric(vertical: 0.0),
                              alignment: Alignment.center,
                              child: demoListCard[index].brand.toString() == "invalid" || demoListCard[index].brand.toString() == "others"
                                  ? const Icon(Icons.credit_card)
                                  : Image.asset('assets/icons/${demoListCard[index].brand.toString()}.png', errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.credit_card);
                                    })
                              // child: CircleAvatar(
                              //     backgroundImage: AssetImage("/assets/icons/${demoListCard[index].brand.toString()}.png"),
                              //     ),
                              ),
                        ),
                        //trailing: Icon(Icons.more_vert),
                        trailing: PopupMenuButton(
                          onSelected: (value) {
                            if (value == 0) {}

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
                        title: Text(demoListCard[index].name.toString()),
                        subtitle: Text(demoListCard[index].number.toString()),
                        dense: false,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddNewCardScreen()));
        },
        backgroundColor: colorButtonsAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}
