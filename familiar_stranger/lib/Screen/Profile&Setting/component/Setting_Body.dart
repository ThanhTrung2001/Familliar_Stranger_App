import 'package:familiar_stranger/Screen/Profile&Setting/component/profile_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/setting.dart';
import 'package:familiar_stranger/network/restApi.dart';
import 'package:flutter/material.dart';

class Setting_Body extends StatefulWidget {
  const Setting_Body({Key? key}) : super(key: key);

  @override
  State<Setting_Body> createState() => _Setting_BodyState();
}

class _Setting_BodyState extends State<Setting_Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Profile_PG(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "SETTING",
              style: TextStyle(
                  color: Main_Text, fontWeight: FontWeight.w900, fontSize: 20),
            ),
            Divider(
              height: 30,
              thickness: 3,
              color: Main_Text,
              indent: 175,
              endIndent: 175,
            ),
            SwitchListTile(
                title: Text(
                  "Sounds",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Main_Text),
                ),
                subtitle: Text(
                  "Enable or Disable notification’s sound",
                  style: TextStyle(fontSize: 11, color: Sub_Text),
                ),
                secondary: const Icon(
                  Icons.volume_down,
                  color: Main_Text,
                ),
                value: userSetting.sound,
                onChanged: (bool value) {
                  setState(() {
                    userSetting.sound = value;
                  });
                  submitUpdateSetting(userSetting);
                }),
            Divider(
              height: 10,
              thickness: 2,
              color: Main_Text,
              indent: 50,
              endIndent: 50,
            ),
            SwitchListTile(
                title: Text(
                  "Vibrations",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Main_Text),
                ),
                subtitle: Text(
                  "Enable or Disable notification’s vibration",
                  style: TextStyle(fontSize: 11, color: Sub_Text),
                ),
                secondary: const Icon(
                  Icons.vibration,
                  color: Main_Text,
                ),
                value: userSetting.vibration,
                onChanged: (bool value) {
                  setState(() {
                    userSetting.vibration = value;
                  });
                  submitUpdateSetting(userSetting);
                }),
            Divider(
              height: 10,
              thickness: 2,
              color: Main_Text,
              indent: 50,
              endIndent: 50,
            ),
            SwitchListTile(
                title: Text(
                  "Notifications",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Main_Text),
                ),
                subtitle: Text(
                  "Enable or Disable app's notification",
                  style: TextStyle(fontSize: 11, color: Sub_Text),
                ),
                secondary: const Icon(
                  Icons.notifications,
                  color: Main_Text,
                ),
                value: userSetting.notification,
                onChanged: (bool value) {
                  setState(() {
                    userSetting.notification = value;
                  });
                  submitUpdateSetting(userSetting);
                }),
            Divider(
              height: 10,
              thickness: 2,
              color: Main_Text,
              indent: 50,
              endIndent: 50,
            ),
            SwitchListTile(
              title: Text(
                "Status",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Main_Text),
              ),
              subtitle: Text(
                "Enable or Disable status showing",
                style: TextStyle(fontSize: 11, color: Sub_Text),
              ),
              secondary: const Icon(
                Icons.online_prediction,
                color: Main_Text,
              ),
              value: userSetting.status,
              onChanged: (bool value)async {
                setState(() {
                  userSetting.status = value;
                });
                if(await submitUpdateSetting(userSetting)) {
                  socket.emit('updateState',(user.id));
                }
              },
            ),
            Divider(
              height: 10,
              thickness: 2,
              color: Main_Text,
              indent: 50,
              endIndent: 50,
            ),
            ListTile(
              title: Text(
                "Procy & Legal",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Main_Text),
              ),
              subtitle: Text(
                "Read for customer",
                style: TextStyle(fontSize: 11, color: Sub_Text),
              ),
              leading: Icon(
                Icons.policy,
                color: Main_Text,
              ),
              onTap: () {},
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.help_center_rounded,
                      color: Sub_Text,
                      size: 50,
                    ),
                    Text(
                      "Need Help?",
                      style: TextStyle(color: Sub_Text, fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
