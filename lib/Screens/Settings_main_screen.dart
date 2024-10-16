import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prove/Colors/color_palette.dart';

import 'Notification_settings_screen.dart';


class SettingsMainScreen extends StatefulWidget {
  @override
  _SettingsMainScreen createState() => _SettingsMainScreen();
}

class _SettingsMainScreen extends State<SettingsMainScreen> {


  void notification(){
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationSettingsScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: variant,
      appBar: AppBar(
        title: Text("SETTINGS", style: TextStyle(color: neutral, fontSize: 30)),
        backgroundColor: primary,
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,top: 20,right: 0, bottom: 5),
                  child: Text("ACCOUNT", style:
                      Theme.of(context).textTheme.headlineSmall
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 5, right: 25,bottom: 10),
                  child: Container(
      
                    width: double.infinity,
                    child: Column(
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
                          child: Container(
                            child: InkWell(
                              onTap: (){
                                print("Cliccato");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20, top: 20),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/user_icon_settings.png"), // immagine
                                    SizedBox(width: 20,),
                                    Text("Account Management", style: Theme.of(context).textTheme.bodyLarge),
                                    Spacer(),
                                    Image.asset('assets/images/right_icon.png'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),// Account management
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    color: neutral,
                                    width: 2,
                                  )
                              )
                          ),
                          child: Container(
                            child: InkWell(
                              onTap: (){
                               notification();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20, top: 20),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/notification_icon.png"), // immagine
                                    SizedBox(width: 20,),
                                    Text("Notifications", style: Theme.of(context).textTheme.bodyLarge),
                                    Spacer(),
                                    Image.asset("assets/images/right_icon.png"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),// Notifications
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    color: neutral,
                                    width: 2,
                                  )
                              )
                          ),
                          child: Container(
                            child: InkWell(
                              onTap: (){
                                print("Cliccato");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20, top: 20),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/log_out_icon.png"), // immagine
                                    SizedBox(width: 20,),
                                    Text("Sing Out", style: Theme.of(context).textTheme.bodyLarge),
                                    Spacer(),
                                    Image.asset("assets/images/right_icon.png"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ), // Sing Out
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),// Account
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,top: 20,right: 0, bottom: 5),
                  child: Text("GENERAL", style:
                  Theme.of(context).textTheme.headlineSmall
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 5, right: 25,bottom: 10),
                  child: Container(
                    width: double.infinity,
                    child: Column(
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
                          child: InkWell( // mi permette di eseguire diverse azioni su un widget con un animazione visibile all'utente
                            onTap: (){
                              print("Cliccato");
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20, top: 20),
                                child: Row(
                                  children: [
                                    Icon(Icons.display_settings), // immagine
                                    SizedBox(width: 20,),
                                    Text("Display", style: Theme.of(context).textTheme.bodyLarge),
                                    Spacer(),
                                    Image.asset('assets/images/right_icon.png'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ), // Display
                        SizedBox(height: 10,),
                        Container(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      color: neutral,
                                      width: 2,
                                    )
                                )
                            ),
                            child: InkWell(
                              onTap: (){
                                print("Cliccato");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20, top: 20),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/language_icon.png"), // immagine
                                    SizedBox(width: 20,),
                                    Text("App Language", style: Theme.of(context).textTheme.bodyLarge),
                                    Spacer(),
                                    Image.asset("assets/images/right_icon.png"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ), // App Language
                        SizedBox(height: 10,),
                        Container(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      color: neutral,
                                      width: 2,
                                    )
                                )
                            ),
                            child: InkWell(
                              onTap: (){
                                print("Cliccato");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20, top: 20),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/lock_icon.png"), // immagine
                                    SizedBox(width: 20,),
                                    Text("Security", style: Theme.of(context).textTheme.bodyLarge),
                                    Spacer(),
                                    Image.asset("assets/images/right_icon.png"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ), // Security
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),// General
        ],
      ),
    );
  }
}
