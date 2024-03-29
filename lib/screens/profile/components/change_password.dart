import 'package:flutter/services.dart';
import 'package:hellowork/constants.dart';

import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    //double bottomPadding = MediaQuery.of(context).padding.bottom;

    // Widget changePasswordButton = InkWell(
    //   onTap: () {},
    //   child: Container(
    //     height: 80,
    //     width: width / 1.5,
    //     decoration: BoxDecoration(
    //         gradient: mainButton,
    //         boxShadow: const [
    //           BoxShadow(
    //             color: Color.fromRGBO(0, 0, 0, 0.16),
    //             offset: Offset(0, 5),
    //             blurRadius: 10.0,
    //           )
    //         ],
    //         borderRadius: BorderRadius.circular(9.0)),
    //     child: const Center(
    //       child: Text("Confirm Change", style: TextStyle(color: Color(0xfffefefe), fontWeight: FontWeight.w600, fontStyle: FontStyle.normal, fontSize: 20.0)),
    //     ),
    //   ),
    // );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Cambiar Contraseña',
          style: TextStyle(color: darkGrey),
        ),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
          //bottom: true,
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0, top: 50),
              child: Text(
                'Enter your current password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Icon(Icons.lock),
                    ),
                    hintText: "Actual Contraseña",
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 12.0),
              child: Text(
                'Enter new password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Icon(Icons.lock),
                    ),
                    hintText: "Nueva Contraseña",
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 12.0),
              child: Text(
                'Retype new password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Icon(Icons.lock),
                    ),
                    hintText: "Repite nueva contraseña",
                  ),
                )),
            const Spacer(
              flex: 2,
            ),

            Padding(
              padding: const EdgeInsets.only(top: defaultPadding, bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  // if (_formState.currentState!.validate()) {}
                },
                child: const Text("Guardar"),
              ),
            ),

            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     padding: EdgeInsets.only(top: 8.0, bottom: bottomPadding != 20 ? 20 : bottomPadding),
            //     width: width,
            //     child: Center(child: changePasswordButton),
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
