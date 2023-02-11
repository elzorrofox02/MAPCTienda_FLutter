import 'package:flutter/material.dart';
import 'package:hellowork/constants.dart';
import 'package:hellowork/screens/payment/components/card_utilis.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, required this.name, required this.email, required this.date, required this.phone}) : super(key: key);

  final String? name, email, date, phone;

  @override
  State<EditProfile> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<EditProfile> {
  final _formState = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _phones = TextEditingController();
  String initialCountry = 'NG';
  //PhoneNumber number = PhoneNumber(isoCode: 'VE');

  PhoneNumber number = PhoneNumber(phoneNumber: "+584121231225", isoCode: 'VE');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _phones.dispose();
    super.dispose();
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
        title: const Text("Editar Perfil", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/icons/me.png'),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        child: Image.asset('assets/icons/profile/edit_square@2x.png', scale: 2),
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text('Editar Foto', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const Spacer(),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (val) {
                        setState(() {});
                      },
                      onSaved: (cardNum) {
                        //_paymentCard.number = CardUtils.getCleanedNumber(cardNum!);
                      },
                      //controller: _controller,
                      initialValue: widget.name,
                      textInputAction: TextInputAction.next,
                      validator: CardUtils.notEmpety,
                      inputFormatters: const [
                        //FilteringTextInputFormatter.digitsOnly,
                        //LengthLimitingTextInputFormatter(19),
                        //CardNumberInputFormatter(),
                      ],
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Icon(Icons.person),
                        ),
                        suffixIcon: SizedBox(
                          width: 40,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                            //child: (_paymentCard.type != null) ? CardUtils.getCardIcon(_paymentCard.type) : null,
                          ),
                        ),
                        hintText: "Nombre",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextFormField(
                        onSaved: (name) {
                          //_paymentCard.name = name;
                        },
                        validator: CardUtils.validateEmail,
                        initialValue: widget.email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(Icons.alternate_email),
                          ),
                          hintText: "Email",
                        ),
                      ),
                    ),
                    TextFormField(
                      onSaved: (name) {
                        //_paymentCard.name = name;
                      },
                      initialValue: widget.date,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Icon(Icons.calendar_month),
                        ),
                        hintText: "Fecha",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: 10),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          //print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          //print(value);
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DIALOG,
                        ),
                        hintText: "Numero",
                        formatInput: false,
                        errorMessage: 'Numero invalido',
                        autoValidateMode: AutovalidateMode.always,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        initialValue: number,
                        textFieldController: _phones,
                        ignoreBlank: true,
                        keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                        inputBorder: const OutlineInputBorder(),
                        onSaved: (PhoneNumber number) {
                          //print('On Saved: $number');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.only(top: defaultPadding),
                child: ElevatedButton(
                  onPressed: () {
                    _formState.currentState?.validate();

                    // if (_formState.currentState!.validate()) {
                    //   Navigator.pop(context);
                    // }
                  },
                  child: const Text("Guardar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
