import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellowork/constants.dart';

import 'package:hellowork/screens/payment/components/card_utilis.dart';
import 'package:hellowork/screens/payment/components/input_formatters.dart';
import 'package:hellowork/screens/payment/components/credit_cart.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({
    super.key,
    //this.listCard
  });

  //final ListCard? listCard;

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final _formState = GlobalKey<FormState>();
  TextEditingController creditCardController = TextEditingController();
  final PaymentCard _paymentCard = PaymentCard();

  @override
  void initState() {
    creditCardController.addListener(
      () {
        _getCardTypeFrmNumber();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    creditCardController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    if (creditCardController.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(creditCardController.text);
      CardType cardType = CardUtils.getCardTypeFrmNumber(input);
      if (cardType != _paymentCard.type) {
        setState(() {
          _paymentCard.type = cardType;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "Añadir Nueva Tarjeta",
          style: TextStyle(color: darkGrey),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              CreditCard(
                color: null,
                cvc: '',
                date: '',
                name: '',
                number: creditCardController.text,
              ),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (val) {
                        setState(() {});
                      },
                      onSaved: (cardNum) {
                        _paymentCard.number = CardUtils.getCleanedNumber(cardNum!);
                      },
                      controller: creditCardController,
                      keyboardType: TextInputType.number,
                      validator: CardUtils.validateCardNum,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(19),
                        CardNumberInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Icon(Icons.credit_card),
                        ),
                        suffixIcon: SizedBox(
                          width: 40,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                            child: (_paymentCard.type != null) ? CardUtils.getCardIcon(_paymentCard.type) : null,
                          ),
                        ),
                        hintText: "Card number",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextFormField(
                        onSaved: (name) {
                          _paymentCard.name = name;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(Icons.person),
                          ),
                          hintText: "Full name",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onSaved: (cvv) {
                              _paymentCard.cvv = int.parse(cvv!);
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            validator: CardUtils.validateCVV,
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Icon(Icons.credit_card),
                              ),
                              hintText: "CVV",
                            ),
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Expanded(
                          child: TextFormField(
                            onSaved: (value) {
                              List<int> expireDate = CardUtils.getExpiryDate(value!);
                              _paymentCard.month = expireDate.first;
                              _paymentCard.year = expireDate[1];
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              CardMonthInputFormatter(),
                            ],
                            validator: CardUtils.validateDate,
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Icon(Icons.calendar_month),
                              ),
                              hintText: "MM/YY",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.qr_code_scanner),
                label: const Text("Scan card"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: defaultPadding),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formState.currentState!.validate()) {}
                  },
                  child: const Text("Add card"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
