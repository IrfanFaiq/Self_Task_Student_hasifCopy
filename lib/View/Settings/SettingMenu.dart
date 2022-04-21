import 'package:flutter/material.dart';
import 'package:self_task_student/View/Settings/Account/ChangePassword.dart';
import 'package:self_task_student/View/Settings/Account/ProfileEdit.dart';
import 'package:self_task_student/View/Settings/Manage%20Subject/SubjectList.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingMenu extends StatefulWidget {
  const SettingMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingMainScreen();
}

class _SettingMainScreen extends State<SettingMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: _settingList(),
    ));
  }

  Widget _settingList() {
    return SettingsList(sections: [
      SettingsSection(title: Text("Account"), tiles: [
        SettingsTile(
          title: Text("Edit Profile"),
          leading: Icon(Icons.person),
          onPressed: (context) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ProfileEdit(),
            ));
          },
        ),
        SettingsTile(
          title: Text("Change Password"),
          leading: Icon(Icons.security),
          onPressed: (context) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ChangePassword(),
            ));
          },
        )
      ]),
      SettingsSection(title: Text("Manage Class"), tiles: [
        SettingsTile(
          title: Text("Archive Class"),
          leading: Icon(Icons.archive),
        ),
        SettingsTile(
          title: Text("Current Subject"),
          leading: Icon(Icons.class_),
          onPressed: (context) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => SubjectList(),
            ));
          },
        )
      ]),
      SettingsSection(title: Text("Personale"), tiles: [
        SettingsTile.switchTile(
          onToggle: (value) {},
          initialValue: false,
          leading: Icon(Icons.dark_mode),
          title: Text('Dark mode'),
        ),
      ]),
      SettingsSection(title: Text("Exit"), tiles: [
        SettingsTile(
          title: Text(
            "Logout",
            style: TextStyle(color: Colors.red),
          ),
          leading: Icon(
            Icons.logout,
            color: Colors.red,
          ),
        ),
      ]),
    ]);
  }
}
