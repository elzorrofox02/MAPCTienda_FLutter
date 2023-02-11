import 'package:flutter/material.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:hellowork/constants.dart';

import 'package:hellowork/models/orden_list.dart';

class MyListOrders extends StatefulWidget {
  const MyListOrders({super.key, required this.typeLoad});

  final String typeLoad;

  @override
  State<MyListOrders> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<MyListOrders> {
  //int currentStep = 2;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<StepperData> stepperData = [
    StepperData(
        title: StepperText("Bolsa",
            textStyle: const TextStyle(
              color: Colors.grey,
            )),
        //subtitle: StepperText("Your order is being prepared"),

        iconWidget: Container(
          //padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.check, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Procesando",
            textStyle: const TextStyle(
              color: Colors.grey,
            )),
        //subtitle: StepperText("Your order is being prepared"),

        iconWidget: Container(
          //padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.check, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Packet",
            textStyle: const TextStyle(
              color: Colors.grey,
            )),
        //subtitle: StepperText("Our delivery executive is on the way to deliver your item"),
        iconWidget: Container(
          //padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.check, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Shiping",
            textStyle: const TextStyle(
              color: Colors.grey,
            )),
        iconWidget: Container(
          //padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.check, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Delivery",
            textStyle: const TextStyle(
              color: Colors.grey,
            )),
        iconWidget: Container(
          decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.check, color: Colors.white),
        )),
  ];

  static status(data) {
    if (data == "bolsa") {
      return {"number": 0, "stepe": 0, "detail": "En Carrito", "action": const Text("En Carrito")};
    } else if (data == "processing_payment") {
      return {"number": 1, "stepe": 1, "detail": "Procesando", "action": const Text("Procesando Pago")};
    } else if (data == "acreddit_payment") {
      return {"number": 2, "stepe": 2, "detail": "Pago Aprovado", "action": const Text("Pago Aprovado")};
    } else if (data == "packet") {
      return {"number": 3, "stepe": 3, "detail": "Preparando", "action": const Text("Preparando Pedido")};
    } else if (data == "shipped") {
      return {"number": 4, "stepe": 4, "detail": "Delivery", "action": const Text("Delivery en Camino")};
    } else if (data == "finish") {
      return {"number": 5, "stepe": 5, "detail": "Completadas", "action": const Text("Entregado")};
    } else if (data == "pendient_payment") {
      return {
        "number": 10,
        "stepe": 0,
        "detail": "Pendiente en Pagar",
        "action": OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: colorButtonsAdd,
            side: const BorderSide(width: 1.0, color: kPrimaryColor),
          ),
          child: const Text('Pendiente en Pagar'),
        )
      };
    } else if (data == "rejected_payment") {
      return {
        "number": 11,
        "stepe": 1,
        "detail": "Cancelada",
        "action": OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: colorButtonsAdd,
            side: const BorderSide(width: 1.0, color: colorButtonsAdd),
          ),
          child: const Text('Pago Rechazado Pagar!'),
        )
      };
    } else if (data == "cancel") {
      return {"number": 12, "stepe": 1, "detail": "Cancelada", "action": const Text("Cancelado", style: TextStyle(color: Colors.red))};
    } else {
      return {"number": 0, "stepe": 0, "detail": "Contactar con Soporte"};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(status(widget.typeLoad)["detail"], style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.black)),
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.vertical,
            child: Container(
              margin: const EdgeInsets.all(30.0), //quitar esto y colocar padding global

              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: demoOrdenListlist.length,
                itemBuilder: (_, index) {
                  final currentStep = status(demoOrdenListlist[index].status)["stepe"];

                  final currentStepColor = status(demoOrdenListlist[index].status)["number"];

                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kTextLightColor, width: 1.5),
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          shape: const Border(
                            bottom: BorderSide(width: 1, color: Colors.grey),
                            //top: BorderSide(width: 1, color: Colors.grey),
                          ),
                          title: Text("${demoOrdenListlist[index].id}", style: const TextStyle(fontSize: 13, color: kSecondaryColor)),
                          subtitle: Text("${demoOrdenListlist[index].create}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColor)),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                          child: AnotherStepper(
                            stepperList: stepperData,
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
                        ListTile(title: const Text("Status"), visualDensity: VisualDensity(horizontal: 0, vertical: -4), trailing: status(demoOrdenListlist[index].status)["action"]),
                        ListTile(
                          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                          title: const Text("Items"),
                          trailing: Text("${demoOrdenListlist[index].totalQuantity}"),
                        ),
                        ListTile(
                          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                          title: const Text("Precio"),
                          trailing: Text("\$ ${demoOrdenListlist[index].totalPrice}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kPrice)),
                        ),
                      ],
                    ),
                  );
                },
                //  final currentStep = status(demoOrdenListlist[index].status)["number"];

                separatorBuilder: (context, index) => const SizedBox(height: 12),
              ),
            )));
  }
}
