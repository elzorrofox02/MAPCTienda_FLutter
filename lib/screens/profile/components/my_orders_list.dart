import 'package:flutter/material.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:hellowork/constants.dart';

import 'package:hellowork/models/orden_list.dart';
import 'package:hellowork/screens/profile/components/my_orden_list_detail.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hellowork/screens/profile/components/utils_ordens.dart';

class MyListOrders extends StatefulWidget {
  const MyListOrders({super.key, required this.typeLoad, required this.status});

  final String typeLoad;
  final num status;

  @override
  State<MyListOrders> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<MyListOrders> {
  List<OrdenList>? post = [];

  @override
  void initState() {
    super.initState();
    _getProduct();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getProduct() async {
    final response = await http.get(Uri.parse("http://192.168.0.73:3000/auth/profile/order?status=${widget.status}"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZWU5MmE3N2QxMTdmNjA0OTgwOTEwYmMiLCJpYXQiOjE2NDIyMjM5MzN9.SqKdM6MQ7VO56t-AlXagYgUjLjNqYCrIdcjUmXXuVk4',
    });

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body)?["items"];

      setState(() {
        post = jsonData.map<OrdenList>(OrdenList.fromJson).toList();
      });
    } else {
      print("algo pasooo");
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
          title: Text(OrdenUtils.status(widget.typeLoad)["detail"], style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.black)),
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.vertical,
            child: Container(
              margin: const EdgeInsets.all(30.0), //quitar esto y colocar padding global

              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                //itemCount: demoOrdenListlist.length,
                itemCount: post!.length,
                itemBuilder: (_, index) {
                  final consult = OrdenUtils.status(post?[index].status);
                  final currentStep = consult["stepe"];
                  final currentStepColor = consult["number"];
                  //final currentStep = status(post?[index].status)["stepe"];
                  //final currentStepColor = status(post?[index].status)["number"];

                  return Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffeaefff)),
                      //color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: kTextLightColor, width: 1.5),
                    //   borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    // ),
                    child: Column(
                      children: [
                        ListTile(
                          shape: const Border(
                            bottom: BorderSide(width: 1, color: Color(0xffeaefff)),
                            //top: BorderSide(width: 1, color: Colors.grey),
                          ),
                          title: Text("${post?[index].id}", style: const TextStyle(fontSize: 13, color: kSecondaryColor)),
                          subtitle: Text("${post?[index].create}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColor)),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => MyOrdenDetail(
                                    orden: post?[index],
                                  ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                          child: AnotherStepper(
                            stepperList: OrdenUtils.stepperData,
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
                        ListTile(title: const Text("Status"), visualDensity: const VisualDensity(horizontal: 0, vertical: -4), trailing: consult["action"]),
                        ListTile(
                          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                          title: const Text("Items"),
                          trailing: Text("${post?[index].totalQuantity}"),
                        ),
                        ListTile(
                          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                          title: const Text("Precio"),
                          trailing: Text("\$ ${post?[index].totalPrice}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kPrice)),
                        ),
                      ],
                    ),
                  );
                },

                separatorBuilder: (context, index) => const SizedBox(height: 12),
              ),
            )));
  }
}
