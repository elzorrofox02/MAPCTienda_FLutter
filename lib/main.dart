import 'package:flutter/material.dart';
import 'package:hellowork/constants.dart';
import 'package:hellowork/screens/home/home_screen.dart';
import 'package:hellowork/screens/tabs/tabs.dart';
import 'package:hellowork/screens/cart/cart.dart';

import 'package:hellowork/mainProvider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => CartProvider(),
        ),
        //Provider(builder: (context) => SomeOtherClass()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _State();
}

class _State extends State<MyApp> {
  int selectedPageIndex = 0;
  static const List<Widget> _pages = <Widget>[HomeScreen(), TabBarDemo(), Cart()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          /* fontFamily: "Gordita", */
          //primarySwatch: Colors.blue,
          //scaffoldBackgroundColor: bgColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: Scaffold(
          body: IndexedStack(
            index: selectedPageIndex,
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
              //backgroundColor: Colors.white10,
              iconSize: 24,
              //elevation: 0,
              mouseCursor: SystemMouseCursors.grab, //Web
              //selectedFontSize: 24,
              //selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 40),
              //selectedItemColor: Colors.amberAccent,
              //selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              //showSelectedLabels: false,
              //showUnselectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.call),
                  label: 'Calls',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.camera),
                  label: 'Camera',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chats',
                ),
              ],
              currentIndex: selectedPageIndex,
              onTap: (int index) {
                setState(() {
                  selectedPageIndex = index;
                });
              }),
        ));
  }
}
