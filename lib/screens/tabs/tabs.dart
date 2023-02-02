import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  /* TabBar get _tabBar => TabBar(
        tabs: [
          Tab(
            text: "Realizadas",
          ),
          Tab(
            text: "Por pagar",
          ),
          Tab(
            text: "Rechazadas",
          ),
          Tab(
            text: "Canceladas",
          ),
          Tab(icon: Icon(Icons.directions_car)),
        ],
      ); */

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: BackButton(
              color: Colors.black,
              onPressed: () => Navigator.of(context).pop(), // <-- SEE HERE
            ),
            title: const Text(
              'Tabs Demo',
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              IconButton(
                color: Colors.black,
                icon: const Icon(Icons.search),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
                },
              ),
            ],
            /* bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                child: _tabBar,
              ),
            ), */
            bottom: const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,

                //indicatorWeight: 50,
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: 53, right: 53),
                //labelColor: Colors.red,
                // unselectedLabelColor: Colors.grey,
                // labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                // unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),

                physics: BouncingScrollPhysics(),
                indicator: BoxDecoration(color: Color.fromARGB(255, 223, 224, 224)), //Change background color from here
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
