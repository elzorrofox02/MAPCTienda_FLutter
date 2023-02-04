import 'package:flutter/material.dart';

//import 'package:flutter_application_1/app_properties.dart';
//import 'package:flutter_application_1/screens/shop/check_out_page.dart';+

//import 'package:hellowork/components/image_viewer.dart';

//import 'package:hellowork/screens/payment/payment_page.dart';

import 'package:hellowork/screens/payment/components/add_new_card.dart';
import 'package:hellowork/screens/payment/components/credit_cart.dart';
import 'package:hellowork/screens/profile/components/change_password.dart';

import 'package:hellowork/screens/address/adress_list.dart';
import 'package:hellowork/constants.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: AdressListPage());
  }
}
