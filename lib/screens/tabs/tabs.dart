import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  static const tabs = [
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_bike)),
    Tab(icon: Icon(Icons.directions_bike)),
    Tab(icon: Icon(Icons.directions_bike)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: const BackButton(
              color: Colors.white, // <-- SEE HERE
            ),
            title: const Text('Tabs Demo'),
            bottom: const TabBar(
                //indicatorWeight: 50,
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: 53, right: 53),
                //labelColor: Colors.red,
                // unselectedLabelColor: Colors.grey,
                // labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                // unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
                physics: BouncingScrollPhysics(),
                indicator: BoxDecoration(color: Colors.greenAccent), //Change background color from here
                tabs: tabs),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
