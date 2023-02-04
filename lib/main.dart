import 'package:flutter/material.dart';
import 'package:hellowork/constants.dart';
import 'package:hellowork/screens/home/home_screen.dart';
import 'package:hellowork/screens/tabs/tabs.dart';
import 'package:hellowork/screens/profile/components/my_orders.dart';
import 'package:hellowork/screens/cart/cart.dart';
import 'package:hellowork/screens/profile/profile_screen.dart';

import 'package:hellowork/cart_povider.dart';

import 'package:hellowork/screens/test.dart';

import 'package:hellowork/components/load_svgicon.dart';

import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

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

  //final screen = [HomeScreen(), TabBarDemo(), Cart()];
  final List<Widget> _pages = const <Widget>[HomeScreen(), ProfileOrders(), Cart(), ProfileScreen(), Test()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        //initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          //'/': (context) => const HomeScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/orders': (context) => const TabBarDemo(),
        },
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
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFF8F8F9),
            hintStyle: TextStyle(
              color: Color(0xFFB8B5C3),
            ),
            border: defaultOutlineInputBorder,
            enabledBorder: defaultOutlineInputBorder,
            focusedBorder: defaultOutlineInputBorder,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorButtonsAdd,
              minimumSize: const Size(double.infinity, 56),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          // outlinedButtonTheme: OutlinedButtonThemeData(
          //   style: OutlinedButton.styleFrom(
          //     foregroundColor: Colors.black,
          //     minimumSize: const Size(double.infinity, 56),
          //     shape: const RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(12)),
          //     ),
          //   ),
          // ),
        ),
        home: Scaffold(
          body: _pages[selectedPageIndex],
          bottomNavigationBar: Theme(
            data: ThemeData(
                //canvasColor: Colors.black,
                ),
            child: BottomNavigationBar(
                selectedFontSize: 12,
                iconSize: 24,
                //elevation: 0,
                mouseCursor: SystemMouseCursors.grab, //Web
                //selectedFontSize: 24,
                //selectedIconTheme: IconThemeData(color: Colors.red, size: 24),
                //selectedItemColor: Colors.amberAccent,
                // selectedLabelStyle: const TextStyle(
                //   fontWeight: FontWeight.bold,
                //   color: Colors.black,
                // ),
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: selectedPageIndex,
                items: <BottomNavigationBarItem>[
                  const BottomNavigationBarItem(
                    icon: SvgLoad(src: "assets/icons/Shop.svg"),
                    /* icon: Icon(
                      Icons.call,
                      color: Colors.black,
                    ), */
                    label: 'Home',
                  ),
                  const BottomNavigationBarItem(
                    /* icon: Icon(
                      Icons.call,
                      color: Colors.black,
                    ), */
                    icon: SvgLoad(src: "assets/icons/Category.svg"),
                    label: 'tabs',
                  ),
                  BottomNavigationBarItem(
                    icon: badges.Badge(
                      //position: badges.BadgePosition.topEnd(top: -100, end: -12),
                      showBadge: true,
                      position: badges.BadgePosition.topEnd(top: -12, end: -12),
                      badgeContent: Consumer<CartProvider>(
                        builder: (context, cart, child) => Text(cart.totalItems, style: const TextStyle(color: Colors.white)),
                      ),

                      badgeAnimation: const badges.BadgeAnimation.rotation(
                        animationDuration: Duration(seconds: 1),
                        colorChangeAnimationDuration: Duration(seconds: 1),
                        loopAnimation: false,
                        curve: Curves.fastOutSlowIn,
                        colorChangeAnimationCurve: Curves.easeInCubic,
                      ),
                      badgeStyle: const badges.BadgeStyle(
                        // shape: badges.BadgeShape.square,
                        badgeColor: Colors.red,
                        //padding: EdgeInsets.all(5),
                        //borderSide: BorderSide(color: Colors.white, width: 2),
                        //borderGradient: badges.BadgeGradient.linear(colors: [Colors.red, Colors.black]),
                        /* badgeGradient: badges.BadgeGradient.linear(
                          colors: [Colors.blue, Colors.yellow],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ), */
                        //elevation: 0,
                      ),
                      child: const SvgLoad(src: "assets/icons/Bag.svg"),
                      /* const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ), */
                    ),
                    label: 'Cart',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    // icon: Icon(
                    //   Icons.call,
                    //   color: Colors.black,
                    // ),

                    label: 'Profile',
                  ),
                  const BottomNavigationBarItem(
                    icon: SvgLoad(src: "assets/icons/Bookmark.svg"),
                    /* icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ), */
                    label: 'test',
                  ),
                ],
                onTap: (int index) {
                  setState(() {
                    selectedPageIndex = index;
                  });
                }),
          ),
        ));
  }
}
