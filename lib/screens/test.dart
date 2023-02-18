import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hellowork/screens/profile/components/my_orders_list.dart';
import 'package:hellowork/constants.dart';
import 'package:http/http.dart' as http;

import 'package:easy_stepper/easy_stepper.dart';
//import 'package:flutter/cupertino.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<Test> {
  Map<String, dynamic>? paymentIntent;

  int step = 0;

  @override
  void initState() {
    super.initState();
    google();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void Confirm() async {
    final paymentIntent = await Stripe.instance.handleNextAction("pi_3McYRyEmR1NGhpXV1hvfqJMo_secret_yJIzYyTUXp5IsAthtE2amvS1J");
  }

  Future<void> google() async {
    final googlePaySupported = await Stripe.instance.isPlatformPaySupported(googlePay: IsGooglePaySupportedParams());

    print(googlePaySupported);
  }

  Future<Map<String, dynamic>> _createTestPaymentSheet() async {
    final url = Uri.parse('http://192.168.0.73:3000/cart/payment/stripe/googleapple');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZWU5MmE3N2QxMTdmNjA0OTgwOTEwYmMiLCJpYXQiOjE2NDIyMjM5MzN9.SqKdM6MQ7VO56t-AlXagYgUjLjNqYCrIdcjUmXXuVk4'},
    );
    final body = json.decode(response.body);
    if (body['error'] != null) {
      throw Exception(body['error']);
    }
    return body;
  }

  Future<Map<String, dynamic>> _createPaymentIntentPaypal() async {
    final url = Uri.parse('http://192.168.0.73:3000/cart/payment/stripe/paypal');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZWU5MmE3N2QxMTdmNjA0OTgwOTEwYmMiLCJpYXQiOjE2NDIyMjM5MzN9.SqKdM6MQ7VO56t-AlXagYgUjLjNqYCrIdcjUmXXuVk4'},
      body: json.encode({
        'currency': 'Eur',
        'payment_method_types': ['paypal'],
        'amount': 1500
      }),
    );

    return json.decode(response.body);
  }

  Future<void> openpay() async {
    print("opennnnn");
    try {
      print("llego");
      final data = await _createTestPaymentSheet();

      print(data['paymentIntent']);

      const billingDetails = BillingDetails(
        name: 'Flutter Stripe',
        email: 'email@stripe.com',
        phone: '+48888000888',
        address: Address(
          city: 'Houston',
          country: 'US',
          line1: '1459  Circle Drive',
          line2: '',
          state: 'Texas',
          postalCode: '77063',
        ),
      ); // mocked

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Main params
          paymentIntentClientSecret: data['paymentIntent'],
          merchantDisplayName: 'Flutter Stripe Store Demo',
          // Customer params
          customerId: data['customer'],
          customerEphemeralKeySecret: data['ephemeralKey'],
          // Extra params
          primaryButtonLabel: 'Pay now',
          // applePay: const PaymentSheetApplePay(
          //   merchantCountryCode: 'DE',
          // ),
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            testEnv: true,
          ),
          style: ThemeMode.dark,
          appearance: const PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              background: Colors.lightBlue,
              primary: Colors.blue,
              componentBorder: Colors.red,
            ),
            shapes: PaymentSheetShape(
              //borderWidth: 1,
              shadow: PaymentSheetShadowParams(color: Colors.red),
            ),
            primaryButton: PaymentSheetPrimaryButtonAppearance(
              shapes: PaymentSheetPrimaryButtonShape(blurRadius: 8),
              colors: PaymentSheetPrimaryButtonTheme(
                light: PaymentSheetPrimaryButtonThemeColors(
                  background: Color.fromARGB(255, 231, 235, 30),
                  text: Color.fromARGB(255, 235, 92, 30),
                  border: Color.fromARGB(255, 235, 92, 30),
                ),
              ),
            ),
          ),
          billingDetails: billingDetails,
        ),
      );

      confirmPayment();
    } catch (e) {
      print("erorrrrr");
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }

  Future<void> confirmPayment() async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Payment succesfully completed'),
        ),
      );
    } on Exception catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unforeseen error: ${e}'),
          ),
        );
      }
    }
  }

  //Custommm pay

  Future<void> initPaymentSheet() async {
    try {
      final googlePaySupported = await Stripe.instance.isPlatformPaySupported(googlePay: IsGooglePaySupportedParams());
      // 1. create payment intent on the server
      final data = await _createTestPaymentSheet();

      if (googlePaySupported) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            // Enable custom flow
            customFlow: true,
            // Main params
            merchantDisplayName: 'Flutter Stripe Store Demo',
            paymentIntentClientSecret: data['paymentIntent'],
            // Customer keys
            customerEphemeralKeySecret: data['ephemeralKey'],
            customerId: data['customer'],
            // Extra options
            //applePay: PaymentSheetApplePay(merchantCountryCode: 'us'),
            googlePay: const PaymentSheetGooglePay(
              merchantCountryCode: 'us',
              testEnv: true,
            ),
            style: ThemeMode.dark,
          ),
        );
      } else {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            // Enable custom flow
            customFlow: true,
            // Main params
            merchantDisplayName: 'Flutter Stripe Store Demo',
            paymentIntentClientSecret: data['paymentIntent'],
            // Customer keys
            customerEphemeralKeySecret: data['ephemeralKey'],
            customerId: data['customer'],
            // Extra options
            //applePay: PaymentSheetApplePay(merchantCountryCode: 'us'),
            style: ThemeMode.dark,
          ),
        );
      }

      // 2. initialize the payment sheet

      setState(() {
        step = 1;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }

  Future<void> presentPaymentSheet() async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();

      setState(() {
        step = 2;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Payment option selected'),
        ),
      );
    } on Exception catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unforeseen error: ${e}'),
          ),
        );
      }
    }
  }

  Future<void> confirmPaymentCustom() async {
    try {
      // 4. Confirm the payment sheet.
      await Stripe.instance.confirmPaymentSheetPayment();
      setState(() {
        step = 0;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment succesfully completed'),
        ),
      );
    } on Exception catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unforeseen error: ${e}'),
          ),
        );
      }
    }
  }

  //Custommm pay Finn////

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      // CardFormField(
      //   controller: CardFormEditController(),
      // ),

      ElevatedButton(
          onPressed: () async {
            // Confirm();
            openpay();
          },
          child: const Text("OPENNNNNNNN")),

      ElevatedButton(
          onPressed: () async {
            // Confirm();
            Confirm();
          },
          child: const Text("pay")),
      Stepper(
        controlsBuilder: emptyControlBuilder,
        currentStep: step,
        steps: [
          Step(
            title: Text('Init payment'),
            content: LoadingButton(
              onPressed: initPaymentSheet,
              text: 'Init payment sheet',
            ),
          ),
          Step(
            title: Text('Select payment method'),
            content: LoadingButton(
              onPressed: presentPaymentSheet,
              text: 'Select payment method',
            ),
          ),
          Step(
            title: Text('Confirm payment'),
            content: LoadingButton(
              onPressed: confirmPaymentCustom,
              text: 'Pay now',
            ),
          ),
        ],
      ),
      SizedBox(
        height: 40,
      ),
    ]));
  }
}

final ControlsWidgetBuilder emptyControlBuilder = (_, __) => Container();

class LoadingButton extends StatefulWidget {
  final Future Function()? onPressed;
  final String text;

  const LoadingButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 12)),
            onPressed: (_isLoading || widget.onPressed == null) ? null : _loadFuture,
            child: _isLoading
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ))
                : Text(widget.text),
          ),
        ),
      ],
    );
  }

  Future<void> _loadFuture() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed!();
    } catch (e, s) {
      print(e);
      print(s);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error $e')));
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);
//   @override
//   State<Test> createState() => _MyPageState();
// }

// class _MyPageState extends State<Test> {
//   int currentStep = 3;
//   int stepLength = 5;
//   bool complete = false;
//   int activeStep = 0;

//   next() {
//     if (currentStep <= stepLength) {
//       goTo(currentStep + 1);
//     }
//   }

//   back() {
//     if (currentStep > 1) {
//       goTo(currentStep - 1);
//     }
//   }

//   goTo(int step) {
//     setState(() => currentStep = step);
//     if (currentStep > stepLength) {
//       setState(() => complete = true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("widget.title"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           EasyStepper(
//             borderThickness: 0,
//             lineType: LineType.normal,
//             activeStep: activeStep,
//             lineLength: 30,
//             lineDotRadius: 1,
//             lineSpace: 1,
//             stepRadius: 20,
//             lineColor: Colors.green,
//             //borderThickness: 100,
//             padding: 5,
//             activeStepBackgroundColor: Colors.green,
//             unreachedStepIconColor: kTextColor,
//             unreachedStepBorderColor: kTextColor,
//             unreachedStepTextColor: kTextColor,
//             finishedStepBackgroundColor: Colors.green,

//             //unreachedStepBackgroundColor: Colors.deepOrange,
//             //loadingAnimation: Icon(Icons.add),
//             steps: const [
//               EasyStep(
//                 icon: Icon(Icons.check),
//                 title: 'Orden',
//               ),
//               EasyStep(
//                 icon: Icon(Icons.check),
//                 title: 'Procesando',
//               ),
//               EasyStep(
//                 icon: Icon(Icons.check),
//                 title: 'Recoletando',
//               ),
//               EasyStep(
//                 icon: Icon(Icons.check),
//                 title: 'En camino',
//               ),
//               EasyStep(
//                 icon: Icon(Icons.check),
//                 title: 'Entregado',
//               ),
//             ],
//             onStepReached: (index) => setState(() => activeStep = index),
//           ),
//         ]),
//       ),
//       // body: Column(
//       //   mainAxisAlignment: MainAxisAlignment.start,
//       //   children: <Widget>[
//       //     Row(
//       //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       //       children: [
//       //         Text("Orden", style: ordenProgress),
//       //         Text("Procesando", style: ordenProgress),
//       //         Text("Recoletando", style: ordenProgress),
//       //         Text("En camino", style: ordenProgress),
//       //         Text("Entregado", style: ordenProgress),
//       //       ],
//       //     ),
//       //     NumberStepper(
//       //       totalSteps: stepLength,
//       //       width: MediaQuery.of(context).size.width,
//       //       curStep: currentStep,
//       //       stepCompleteColor: Colors.green,
//       //       currentStepColor: Colors.green,
//       //       inactiveColor: Color(0xffbababa),
//       //       lineWidth: 3.5,
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }
