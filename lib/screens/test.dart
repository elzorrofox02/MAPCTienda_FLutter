import 'package:flutter/material.dart';
import 'package:hellowork/screens/profile/components/my_orders_list.dart';
import 'package:hellowork/constants.dart';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';

// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);

//   @override
//   State<Test> createState() => _ExplorePageState();
// }

// class _ExplorePageState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: MyListOrders());
//   }
// }

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  @override
  State<Test> createState() => _MyPageState();
}

class _MyPageState extends State<Test> {
  int currentStep = 3;
  int stepLength = 5;
  bool complete = false;
  int activeStep = 0;

  next() {
    if (currentStep <= stepLength) {
      goTo(currentStep + 1);
    }
  }

  back() {
    if (currentStep > 1) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
    if (currentStep > stepLength) {
      setState(() => complete = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          EasyStepper(
            borderThickness: 0,
            lineType: LineType.normal,
            activeStep: activeStep,
            lineLength: 30,
            lineDotRadius: 1,
            lineSpace: 1,
            stepRadius: 20,
            lineColor: Colors.green,
            //borderThickness: 100,
            padding: 5,
            activeStepBackgroundColor: Colors.green,
            unreachedStepIconColor: kTextColor,
            unreachedStepBorderColor: kTextColor,
            unreachedStepTextColor: kTextColor,
            finishedStepBackgroundColor: Colors.green,

            //unreachedStepBackgroundColor: Colors.deepOrange,
            //loadingAnimation: Icon(Icons.add),
            steps: const [
              EasyStep(
                icon: Icon(Icons.check),
                title: 'Orden',
              ),
              EasyStep(
                icon: Icon(Icons.check),
                title: 'Procesando',
              ),
              EasyStep(
                icon: Icon(Icons.check),
                title: 'Recoletando',
              ),
              EasyStep(
                icon: Icon(Icons.check),
                title: 'En camino',
              ),
              EasyStep(
                icon: Icon(Icons.check),
                title: 'Entregado',
              ),
            ],
            onStepReached: (index) => setState(() => activeStep = index),
          ),
        ]),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: <Widget>[
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Text("Orden", style: ordenProgress),
      //         Text("Procesando", style: ordenProgress),
      //         Text("Recoletando", style: ordenProgress),
      //         Text("En camino", style: ordenProgress),
      //         Text("Entregado", style: ordenProgress),
      //       ],
      //     ),
      //     NumberStepper(
      //       totalSteps: stepLength,
      //       width: MediaQuery.of(context).size.width,
      //       curStep: currentStep,
      //       stepCompleteColor: Colors.green,
      //       currentStepColor: Colors.green,
      //       inactiveColor: Color(0xffbababa),
      //       lineWidth: 3.5,
      //     ),
      //   ],
      // ),
    );
  }
}
