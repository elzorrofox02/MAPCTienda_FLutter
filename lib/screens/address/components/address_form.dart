import 'package:flutter/material.dart';
import 'package:hellowork/constants.dart';

import 'package:hellowork/screens/payment/components/card_utilis.dart';

class AddAddressForm extends StatefulWidget {
  const AddAddressForm({Key? key}) : super(key: key);

  @override
  State<AddAddressForm> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<AddAddressForm> {
  final _formState = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  bool otherPerson = false;
  bool isCompany = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text("Añadir Nueva Direccion", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Form(
                  key: _formState,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (val) {
                          setState(() {});
                        },
                        onSaved: (cardNum) {
                          //_paymentCard.number = CardUtils.getCleanedNumber(cardNum!);
                        },
                        controller: _controller,
                        textInputAction: TextInputAction.next,
                        validator: CardUtils.notEmpety,
                        inputFormatters: const [],
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(Icons.flag),
                          ),
                          hintText: "Pais",
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      TextFormField(
                        onSaved: (name) {
                          //_paymentCard.name = name;
                        },
                        validator: CardUtils.notEmpety,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(Icons.flag),
                          ),
                          hintText: "Estado",
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      TextFormField(
                        onSaved: (name) {
                          //_paymentCard.name = name;
                        },
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(Icons.flag),
                          ),
                          hintText: "Ciudad",
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      TextFormField(
                        onSaved: (name) {
                          //_paymentCard.name = name;
                        },
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(Icons.flag),
                          ),
                          hintText: "Mucicipio",
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      TextFormField(
                        onSaved: (name) {
                          //_paymentCard.name = name;
                        },
                        validator: CardUtils.notEmpety,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(Icons.tag),
                          ),
                          hintText: "Numero",
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      TextFormField(
                        onSaved: (name) {
                          //_paymentCard.name = name;
                        },
                        validator: CardUtils.notEmpety,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(Icons.location_on),
                          ),
                          hintText: "Direccion",
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      SwitchListTile(
                        activeColor: colorButtonsAdd,
                        title: const Text("Recibe otra persona?"),
                        onChanged: (value) {
                          setState(() {
                            otherPerson = !otherPerson;
                          });
                        },
                        value: otherPerson,
                      ),
                      if (otherPerson)
                        Column(
                          children: [
                            TextFormField(
                              onSaved: (name) {
                                //_paymentCard.name = name;
                              },
                              validator: CardUtils.notEmpety,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Icon(Icons.person),
                                ),
                                hintText: "Persona que Recibe",
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              onSaved: (name) {
                                //_paymentCard.name = name;
                              },
                              validator: CardUtils.notEmpety,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Icon(Icons.phone),
                                ),
                                hintText: "Numero Persona Resibe",
                              ),
                            ),
                          ],
                        ),
                      SwitchListTile(
                        activeColor: colorButtonsAdd,
                        title: const Text("Es una Empresa?"),
                        onChanged: (value) {
                          setState(() {
                            isCompany = !isCompany;
                          });
                        },
                        value: isCompany,
                      ),
                      if (isCompany)
                        Column(
                          children: [
                            TextFormField(
                              onSaved: (name) {
                                //_paymentCard.name = name;
                              },
                              validator: CardUtils.notEmpety,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Icon(Icons.person),
                                ),
                                hintText: "Persona que Recibe",
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              onSaved: (name) {
                                //_paymentCard.name = name;
                              },
                              validator: CardUtils.notEmpety,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Icon(Icons.phone),
                                ),
                                hintText: "Numero Persona Resibe",
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                // const Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.only(top: defaultPadding),
                  child: ElevatedButton(
                    onPressed: () {
                      _formState.currentState?.validate();

                      // if (_formState.currentState!.validate()) {
                      //   Navigator.pop(context);
                      // }
                    },
                    child: const Text("Guardar"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
