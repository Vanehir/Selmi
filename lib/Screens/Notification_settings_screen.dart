import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/Screens/Notification_settings_screen.dart';
import '../Texts/Text.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {

  bool documCheck = false;
  bool documCheck1 = false;
  bool documCheck2 = false;
  bool documCheck3 = false;

  bool isSwich = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: variant,
      appBar: AppBar(
        backgroundColor: primary,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        iconTheme: IconThemeData(
          color: neutral
        ),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("NOTIFICATIONS", style: TextStyle(color: neutral,),),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            const Text("Push Notification", style:
            TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),),
            Container(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(DescriptionNotification, ),
                  ),
                  SizedBox(width: 20,),
                  Switch(value: isSwich, onChanged: (bool newvalue){
                    setState(() {
                      isSwich = newvalue;
                    });
                  },
                    activeColor: primary, // Colore quando è attivo
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: neutral,
                            width: 2,
                          )
                      )
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text("Your documentation"),
                        Spacer(),
                        Checkbox(value: documCheck ,activeColor: primary, onChanged: isSwich ? (bool? newvalue){
                          setState(() {
                            documCheck = newvalue ?? false;
                          });
                        }
                        : null
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: neutral,
                            width: 2,
                          )
                      )
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text("Your documentation"),
                        Spacer(),
                        Checkbox(value: documCheck1 ,activeColor: primary, onChanged: isSwich ? (bool? newvalue){
                          setState(() {
                            documCheck1 = newvalue ?? false;
                          });
                        }
                            : null
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Email notification", style: Theme.of(context).textTheme.headlineSmall),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: neutral,
                            width: 2,
                          )
                      )
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text("Your documentation"),
                        Spacer(),
                        Checkbox(value: documCheck2 ,activeColor: primary, onChanged: isSwich ? (bool? newvalue){
                          setState(() {
                            documCheck2 = newvalue ?? false;
                          });
                        }
                            : null
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: neutral,
                            width: 2,
                          )
                      )
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text("Your documentation"),
                        Spacer(),
                        Checkbox(value: documCheck3 ,activeColor: primary, onChanged: isSwich ? (bool? newvalue){
                          setState(() {
                            documCheck3 = newvalue ?? false;
                          });
                        }
                            : null
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      )

    );
  }
}
