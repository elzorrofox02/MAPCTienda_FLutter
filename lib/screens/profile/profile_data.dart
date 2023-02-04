import 'package:flutter/material.dart';
import 'package:hellowork/constants.dart';
import 'package:hellowork/screens/profile/components/change_password.dart';
import 'package:hellowork/screens/profile/components/edit_profile.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({Key? key}) : super(key: key);

  @override
  State<ProfileData> createState() => _State();
}

class _State extends State<ProfileData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text("Direciones", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.black)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const EditProfile(
                        date: '4560',
                        email: 'aasas@asas.com',
                        name: 'adggdagad',
                        phone: '465465465',
                      ))),
              child: const Text('Editar', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: colorButtonsAdd)),
            ),
          ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xff764abc),
                  child: Text("J"),
                ),
                title: Text('Jr pacheco'),
                subtitle: Text('hola@.com'),
              ),
              ListTile(
                //leading: Image.asset(data.icon, scale: 2),
                title: const Text(
                  "Nombre",
                  style: titleProfile,
                ),
                trailing: const Text("ola", style: titleProfileRigth),
                onTap: () {},
                shape: const Border(
                  bottom: BorderSide(color: kTextLightColor),
                ),
              ),
              ListTile(
                //leading: Image.asset(data.icon, scale: 2),
                title: const Text(
                  "Fecha",
                  style: titleProfile,
                ),
                trailing: const Text("12/12/12", style: titleProfileRigth),
                onTap: () {},
                shape: const Border(
                  bottom: BorderSide(color: kTextLightColor),
                ),
              ),
              ListTile(
                //leading: Image.asset(data.icon, scale: 2),
                title: const Text(
                  "Telefono",
                  style: titleProfile,
                ),
                trailing: const Text("+58412454600", style: titleProfileRigth),
                onTap: () {},
                shape: const Border(
                  bottom: BorderSide(color: kTextLightColor),
                ),
              ),
              ListTile(
                //leading: Image.asset(data.icon, scale: 2),
                title: const Text(
                  "Genero",
                  style: titleProfile,
                ),
                trailing: const Text("Masculino", style: titleProfileRigth),
                onTap: () {},
                shape: const Border(
                  bottom: BorderSide(color: kTextLightColor),
                ),
              ),
              ListTile(
                //leading: Image.asset(data.icon, scale: 2),
                title: const Text(
                  "Email",
                  style: titleProfile,
                ),
                trailing: const Text("ola@asa.com", style: titleProfileRigth),
                onTap: () {},
                shape: const Border(
                  bottom: BorderSide(color: kTextLightColor),
                ),
              ),
              ListTile(
                //leading: Image.asset(data.icon, scale: 2),
                title: const Text(
                  "Contraseña",
                  style: titleProfile,
                ),
                trailing: OutlinedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ChangePasswordPage())),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: colorButtonsAdd,
                    side: const BorderSide(width: 1.0, color: colorButtonsAdd),
                  ),
                  child: const Text('Cambiar contraseña'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
