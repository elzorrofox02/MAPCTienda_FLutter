import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({Key? key, required this.number, required this.name}) : super(key: key);

  final String number, name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(color: Colors.deepPurple[700], borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text(
            'CARD',
            style: TextStyle(color: Colors.white),
          ),
          Container(
            height: 25,
            width: 40,
            color: Colors.white,
          ),
          Text(
            number,
            style: const TextStyle(color: Colors.white),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Nombre',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                name,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
