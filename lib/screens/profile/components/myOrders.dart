import 'package:flutter/material.dart';
import 'package:hellowork/screens/tabs/TabsTikect2.dart';
import 'package:hellowork/size_config.dart';

class profileOrders extends StatefulWidget {
  const profileOrders({super.key});
  @override
  State<profileOrders> createState() => _StateprofileOrders();
}

class _StateprofileOrders extends State<profileOrders> {
  @override
  Widget build(BuildContext context) {
    final size = SizeConfig.getSize(context);
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getHeigth(20), vertical: SizeConfig.getHeigth(20)),
            children: [
              SizedBox(
                height: SizeConfig.getHeigth(40),
              ),
              const Text("My Orders"),
              SizedBox(
                height: SizeConfig.getHeigth(20),
              ),
              const ApptikeTabs2(
                firstabs: "hola",
                secondtabs: "holaxxx",
              ),
              SizedBox(
                height: SizeConfig.getHeigth(20),
              ),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.getHeigth(15)),
              )
            ],
          )
        ],
      ),
    );
  }
}
