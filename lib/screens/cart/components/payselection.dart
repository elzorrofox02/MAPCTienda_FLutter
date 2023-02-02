import 'package:flutter/material.dart';

class paySelection extends StatefulWidget {
  const paySelection({Key? key}) : super(key: key);

  @override
  State<paySelection> createState() => _OrderConfirmScreenState();
}

enum selection { visa, paypal, binance }

class _OrderConfirmScreenState extends State<paySelection> {
  selection? _selection = selection.visa;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
        title: const Text("Confirm", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.black)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(33.0),
          child: Center(
            child: Column(children: <Widget>[
              Container(
                //padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: _selection == selection.visa ? Border.all(width: 1.0, color: Colors.black) : Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.transparent,
                ),
                child: RadioListTile<selection>(
                  secondary: Image.asset('assets/icons/pay/visa.png'),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Tarjeta Credito',
                    style: TextStyle(
                      color: _selection == selection.visa ? Colors.black : Colors.grey,
                    ),
                  ),
                  value: selection.visa,
                  groupValue: _selection,
                  onChanged: (selection? value) {
                    setState(() {
                      _selection = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 15.0),
              Container(
                decoration: BoxDecoration(
                  border: _selection == selection.paypal ? Border.all(width: 1.0, color: Colors.black) : Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.transparent,
                ),
                child: RadioListTile<selection>(
                  secondary: Image.asset('assets/icons/pay/paypal.png'),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Paypal',
                    style: TextStyle(
                      color: _selection == selection.paypal ? Colors.black : Colors.grey,
                    ),
                  ),
                  value: selection.paypal,
                  groupValue: _selection,
                  onChanged: (selection? value) {
                    setState(() {
                      _selection = value;
                    });
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: _selection == selection.binance ? Border.all(width: 1.0, color: Colors.black) : Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.transparent,
                ),
                child: RadioListTile<selection>(
                  secondary: Image.asset('assets/icons/pay/Binance_logo.jpg'),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Binance Pay',
                    style: TextStyle(
                      color: _selection == selection.binance ? Colors.black : Colors.grey,
                    ),
                  ),
                  value: selection.binance,
                  groupValue: _selection,
                  onChanged: (selection? value) {
                    setState(() {
                      _selection = value;
                    });
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
