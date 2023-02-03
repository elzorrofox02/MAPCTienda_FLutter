//import 'package:hellowork/screens/payment/';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellowork/constants.dart';
import 'dart:math' as math;

import 'package:hellowork/screens/payment/color_list.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Color active = Colors.red;
  TextEditingController cardNumber = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController cvc = TextEditingController();
  TextEditingController cardHolder = TextEditingController();

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection.index == 1) {
        FocusScope.of(context).requestFocus(FocusNode());
      }
    });
  }

  String convertCardNumber(String src, String divider) {
    String newStr = '';
    int step = 4;
    for (int i = 0; i < src.length; i += step) {
      newStr += src.substring(i, math.min(i + step, src.length));
      if (i + step < src.length) newStr += divider;
    }
    return newStr;
  }

  String convertMonthYear(String month, String year) {
    if (month.isNotEmpty) {
      return '$month/$year';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget addThisCard = InkWell(
//      onTap: () => Navigator.of(context)
//          .push(MaterialPageRoute(builder: (_) => ViewProductPage())),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: const Center(
          child: Text("Add This Card", style: TextStyle(color: Color(0xfffefefe), fontWeight: FontWeight.w600, fontStyle: FontStyle.normal, fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) => GestureDetector(
          onPanDown: (val) {},
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            controller: scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: kToolbarHeight),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'Payment',
                          style: TextStyle(
                            color: darkGrey,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CloseButton()
                      ],
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(32.0),
                      decoration: BoxDecoration(color: active, borderRadius: const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'CREDIT CARD',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 25,
                                width: 40,
                                color: Colors.white,
                              ),
                              Flexible(child: Center(child: Text(convertCardNumber(cardNumber.text, '-'), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0)))),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[Text(convertMonthYear(month.text, year.text), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(cvc.text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))],
                          ),
                          const Spacer(),
                          Text(cardHolder.text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Colors.red, Colors.blue, Colors.purple[700], Colors.green[700], Colors.lightBlueAccent]
                            .map((c) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      active = c ?? Colors.red;
                                    });
                                  },
                                  child: Transform.scale(
                                      scale: active == c ? 1.2 : 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ColorOption(c ?? Colors.red),
                                      )),
                                ))
                            .toList(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.white, boxShadow: shadow, borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              inputFormatters: [LengthLimitingTextInputFormatter(16)],
                              controller: cardNumber,
                              onChanged: (val) {
                                setState(() {});
                              },
                              decoration: const InputDecoration(border: InputBorder.none, hintText: 'Card Number'),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    inputFormatters: [LengthLimitingTextInputFormatter(2)],
                                    controller: month,
                                    decoration: const InputDecoration(border: InputBorder.none, hintText: 'Month'),
                                    onChanged: (val) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    inputFormatters: [LengthLimitingTextInputFormatter(2)],
                                    controller: year,
                                    decoration: const InputDecoration(border: InputBorder.none, hintText: 'Year'),
                                    onChanged: (val) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    controller: cvc,
                                    decoration: const InputDecoration(border: InputBorder.none, hintText: 'CVC'),
                                    onChanged: (val) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: cardHolder,
                              decoration: const InputDecoration(border: InputBorder.none, hintText: 'Name on card'),
                              onChanged: (val) {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: addThisCard,
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
