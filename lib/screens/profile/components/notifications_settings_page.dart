import 'package:flutter/services.dart';
import 'package:hellowork/constants.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool myOrders = true;
  bool reminders = true;
  bool newOffers = true;
  bool feedbackReviews = true;
  bool updates = true;

  /* Widget platformSwitch(bool val) {
    return Switch(
      value: val,
      activeColor: yellow,
      onChanged: (value) {
        print(val);
        print(value);
        setState(() {
          val = false;
        });
      },
    );
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Settings',
          style: TextStyle(color: darkGrey),
        ),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Notifications',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: const Text('My orders'),
                      trailing: Switch(
                        value: myOrders,
                        activeColor: yellow,
                        onChanged: (value) {
                          setState(() {
                            myOrders = !myOrders;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Reminders'),
                      trailing: Switch(
                        value: reminders,
                        activeColor: yellow,
                        onChanged: (value) {
                          setState(() {
                            reminders = !reminders;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('New Offers'),
                      trailing: Switch(
                        value: newOffers,
                        activeColor: yellow,
                        onChanged: (value) {
                          setState(() {
                            newOffers = !newOffers;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Feedbacks and Reviews'),
                      trailing: Switch(
                        value: feedbackReviews,
                        activeColor: yellow,
                        onChanged: (value) {
                          setState(() {
                            feedbackReviews = !feedbackReviews;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Updates'),
                      trailing: Switch(
                        value: updates,
                        activeColor: yellow,
                        onChanged: (value) {
                          setState(() {
                            updates = !updates;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
