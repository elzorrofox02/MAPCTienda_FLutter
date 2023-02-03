import 'package:flutter/material.dart';
import 'package:hellowork/screens/profile/setting.dart';
import 'package:hellowork/screens/profile/components/change_language_page.dart';
import 'package:hellowork/screens/payment/payment_page.dart';

typedef ProfileOptionTap = void Function();

class ProfileOption {
  String title;
  String icon;
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
  static _profileIcon(String last) => 'assets/icons/profile/$last';
  bool _isDark = false;
  get datas => <ProfileOption>[
        ProfileOption.arrow(title: 'Edit Profile', navigator: const SettingsPage(), icon: _profileIcon('user@2x.png')),
        ProfileOption.arrow(title: 'Adress', icon: _profileIcon('location@2x.png')),
        ProfileOption.arrow(title: 'Notification', icon: _profileIcon('notification@2x.png')),
        ProfileOption.arrow(title: 'My Orders', routess: "/orders", icon: _profileIcon('Buy@2x.png')),
        ProfileOption.arrow(title: 'My Whitelish', icon: _profileIcon('heart@2x.png')),
        ProfileOption.arrow(title: 'Payment', navigator: const PaymentPage(), icon: _profileIcon('wallet@2x.png')),
        ProfileOption.arrow(title: 'Security', icon: _profileIcon('shield_done@2x.png')),
        _languageOption(),
        _darkModel(),
        ProfileOption.arrow(title: 'Help Center', icon: _profileIcon('info_square@2x.png')),
        ProfileOption.arrow(title: 'Invite Friends', icon: _profileIcon('user@2x.png')),
        ProfileOption(
          title: 'Logout',
          routess: "/orders",
          icon: _profileIcon('logout@2x.png'),
          titleColor: const Color(0xFFF75555),
        ),
      ];

  _languageOption() => ProfileOption(
      navigator: const ChangeLanguagePage(),
      title: 'Language',
      //routess: "/orders",
      icon: _profileIcon('more_circle@2x.png'),
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
      icon: _profileIcon('show@2x.png'),
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
      leading: Image.asset(data.icon, scale: 2),
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
