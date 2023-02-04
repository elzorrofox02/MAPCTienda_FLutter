import 'package:flutter/material.dart';
import 'package:hellowork/screens/profile/setting.dart';
import 'package:hellowork/screens/profile/profile_data.dart';
import 'package:hellowork/screens/profile/components/change_language_page.dart';
import 'package:hellowork/screens/payment/components/add_new_card.dart';
import 'package:hellowork/screens/address/adress_list.dart';

typedef ProfileOptionTap = void Function();

class ProfileOption {
  String title;
  dynamic icon;
  dynamic routess;
  dynamic navigator;
  Color? titleColor;
  ProfileOptionTap? onClick;
  Widget? trailing;

  ProfileOption({
    required this.title,
    required this.icon,
    this.onClick,
    this.routess,
    this.navigator,
    this.titleColor,
    this.trailing,
  });

  ProfileOption.arrow({
    required this.title,
    required this.icon,
    this.onClick,
    this.routess,
    this.navigator,
    this.titleColor = const Color(0xFF212121),
    this.trailing = const Image(image: AssetImage('assets/icons/profile/arrow_right@2x.png'), width: 24, height: 24),
  });
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  //static String route() => '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //static _profileIcon(String last) => 'assets/icons/profile/$last';
  bool _isDark = false;
  get datas => <ProfileOption>[
        ProfileOption.arrow(title: 'Mis datos', navigator: const ProfileData(), icon: const Icon(Icons.account_circle)),
        ProfileOption.arrow(title: 'Notification', icon: const Icon(Icons.notifications_active)),
        ProfileOption.arrow(title: 'Ordenes', routess: "/orders", icon: const Icon(Icons.library_books)),
        ProfileOption.arrow(title: 'Favoritos', icon: const Icon(Icons.favorite)),
        ProfileOption.arrow(title: 'Mi Dirreciones', navigator: const AdressListPage(), icon: const Icon(Icons.location_on)),
        ProfileOption.arrow(title: 'Mi Tarjetas', navigator: const AddNewCardScreen(), icon: const Icon(Icons.credit_card)),
        ProfileOption.arrow(title: 'Security', icon: const Icon(Icons.lock)),
        ProfileOption.arrow(title: 'Preferencias', navigator: const SettingsPage(), icon: const Icon(Icons.visibility)),
        _languageOption(),
        _darkModel(),
        ProfileOption.arrow(title: 'Help Center', icon: const Icon(Icons.help)),
        ProfileOption.arrow(title: 'Invite Friends', icon: const Icon(Icons.group_add)),
        ProfileOption(
          title: 'Logout',
          routess: "/orders",
          icon: const Icon(Icons.logout),
          titleColor: const Color(0xFFF75555),
        ),
      ];

  _languageOption() => ProfileOption(
      navigator: const ChangeLanguagePage(),
      title: 'Language',
      //routess: "/orders",
      icon: const Icon(Icons.language),
      trailing: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'English (US)',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFF212121)),
            ),
            const SizedBox(width: 16),
            Image.asset('assets/icons/profile/arrow_right@2x.png', scale: 2)
          ],
        ),
      ));

  _darkModel() => ProfileOption(
      title: 'Dark Mode',
      // routess: "/orders",
      icon: const Icon(Icons.dark_mode),
      trailing: Switch(
        value: _isDark,
        activeColor: const Color(0xFF212121),
        onChanged: (value) {
          setState(() {
            _isDark = !_isDark;
          });
        },
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Mi perfil"),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverList(
            delegate: SliverChildListDelegate.fixed([
              ProfileHeader(),
            ]),
          ),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 10.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final data = datas[index];
            return _buildOption(context, index, data);
          },
          childCount: datas.length,
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, int index, ProfileOption data) {
    return ListTile(
      leading: data.icon,
      //leading: Image.asset(data.icon, scale: 2),
      title: Text(
        data.title,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: data.titleColor),
      ),
      trailing: data.trailing,
      onTap: () {
        if (data.routess != null) Navigator.pushNamed(context, data.routess);
        if (data.navigator != null) Navigator.of(context).push(MaterialPageRoute(builder: (_) => data.navigator));
      },
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
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
        const Text('Mansuriosdev', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        const SizedBox(height: 8),
        const Text('99 300 00 00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 20),
        Container(
          color: const Color(0xFFEEEEEE),
          height: 1,
          padding: const EdgeInsets.symmetric(horizontal: 24),
        )
      ],
    );
  }
}
