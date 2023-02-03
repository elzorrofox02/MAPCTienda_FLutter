import 'package:flutter/material.dart';

import 'package:hellowork/size_config.dart';

import 'package:hellowork/screens/tabs/tabs_tikect_two.dart';

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
