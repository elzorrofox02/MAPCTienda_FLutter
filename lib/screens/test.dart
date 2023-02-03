import 'package:flutter/material.dart';

//import 'package:flutter_application_1/app_properties.dart';
//import 'package:flutter_application_1/screens/shop/check_out_page.dart';+

//import 'package:hellowork/components/image_viewer.dart';

import 'package:hellowork/screens/payment/payment_page.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaymentPage()));
          },
          child: const Text("Abreme")),
    );
  }
}
