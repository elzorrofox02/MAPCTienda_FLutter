import 'package:flutter/services.dart';
import 'package:hellowork/screens/profile/components/change_password.dart';
import 'package:hellowork/screens/profile/components/notifications_settings_page.dart';
import 'package:hellowork/screens/profile/components/legal_about_page.dart';
import 'package:hellowork/screens/profile/components/change_country.dart';
import 'package:hellowork/screens/profile/components/faq_page.dart';
import 'package:flutter/material.dart';
import 'package:hellowork/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      //painter: MainBackground(),
      child: Scaffold(
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
          child: LayoutBuilder(
              builder: (builder, constraints) => SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'General',
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              title: const Text('Change Country'),
                              leading: const Icon(Icons.flag),
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ChangeCountryPage())),
                            ),
                            ListTile(
                              title: const Text('Notifications'),
                              leading: const Icon(Icons.notifications_active),
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const NotificationSettingsPage())),
                            ),
                            ListTile(
                              title: const Text('Legal & About'),
                              leading: const Icon(Icons.policy),
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LegalAboutPage())),
                            ),
                            ListTile(
                              title: const Text('Help'),
                              leading: const Icon(Icons.contact_support),
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FaqPage())),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Text(
                                'Account',
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                              ),
                            ),
                            ListTile(
                              title: const Text('Change Password'),
                              leading: const Icon(Icons.lock),
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ChangePasswordPage())),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
