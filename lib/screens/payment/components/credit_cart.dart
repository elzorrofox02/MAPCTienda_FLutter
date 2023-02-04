import 'package:flutter/material.dart';
import 'package:hellowork/screens/payment/color_list.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({Key? key, required this.number, required this.name, required this.date, required this.cvc, required this.color}) : super(key: key);
  final String number, name, date, cvc;
  final Color? color;

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  Color active = Colors.red;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  Flexible(child: Center(child: Text(widget.number, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0)))),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text(widget.date, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(widget.cvc, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))],
              ),
              const Spacer(),
              Text(widget.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0))
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
      ],
    );
  }
}
