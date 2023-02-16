import 'package:flutter/material.dart';
import 'package:hellowork/constants.dart';
import 'package:another_stepper/another_stepper.dart';

class OrdenUtils {
  static status(data) {
    if (data == "bolsa") {
      return {"number": -1, "stepe": -1, "detail": "En Carrito", "action": const Text("En Carrito")};
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
    } else if (data == "cart") {
      return {"number": 1, "stepe": 1, "detail": "En Carrito", "action": const Text("Pagar")};
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

  static List<StepperData> stepperData = [
    // StepperData(
    //     title: StepperText("Bolsa",
    //         textStyle: const TextStyle(
    //           color: Colors.grey,
    //         )),
    //     //subtitle: StepperText("Your order is being prepared"),

    //     iconWidget: Container(
    //       //padding: const EdgeInsets.all(8),
    //       decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(30))),
    //       child: const Icon(Icons.check, color: Colors.white),
    //     )),
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
        title: StepperText("Delivery",
            textStyle: const TextStyle(
              color: Colors.grey,
            )),
        iconWidget: Container(
          //padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.check, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Entrega",
            textStyle: const TextStyle(
              color: Colors.grey,
            )),
        iconWidget: Container(
          decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.check, color: Colors.white),
        )),
  ];

  static method(data) {
    if (data == "express") {
      return {"mth": "Delivery Express"};
    } else if (data == "express_programic") {
      return {"mth": "Delivery Programado"};
    } else if (data == "province") {
      return {"mth": "Envio Encomienda"};
    } else if (data == "shop") {
      return {
        "mth": "Retirar en Tienda",
      };
    } else {
      return {"mth": "No selecionado"};
    }
  }
}
