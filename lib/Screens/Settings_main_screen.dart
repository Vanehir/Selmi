import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:prove/Navigation_component/Navigation.dart';
import 'package:prove/Screens/Qr_scan_main_screen.dart';
import 'package:prove/Screens/Saved_main_screen.dart';
import 'package:prove/Screens/Search_main_screen.dart';
import 'package:prove/Screens/Home_Screen.dart';
import 'package:prove/widgets/customer_scaffold.dart';
import 'package:prove/Screens/Settings_main_screen.dart';


class SettingsMainScreen extends StatefulWidget {
  @override
  _SettingsMainScreen createState() => _SettingsMainScreen();
}

class _SettingsMainScreen extends State<SettingsMainScreen> {

  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Naviga alla pagina giusta in base all'indice
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchMainScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QrScanMainScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SavedMainScreen()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsMainScreen()),
        );
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Text("Settings", style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFF25344D)
        ),),
        SizedBox(height: 50,),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 20,right: 0, bottom: 5),
                child: Text("Acount", style:
                TextStyle(
                  color: Color(0xFF59729D),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 5, right: 25,bottom: 10),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        child: Container(
                          child: InkWell(
                            onTap: (){
                              print("Cliccato");
                            },
                            child: Row(
                              children: [
                                Image.asset("assets/images/user_icon_settings.png"), // immagine
                                SizedBox(width: 20,),
                                Text("Account Management", style: TextStyle(fontSize: 25, color: Color(0xFF25344D)),),
                                Spacer(),
                                Image.asset('assets/images/right_icon.png'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),// Account management
                      Container(
                        child: Container(
                          child: InkWell(
                            onTap: (){
                              print("Cliccato");
                            },
                            child: Row(
                              children: [
                                Image.asset("assets/images/notification_icon.png"), // immagine
                                SizedBox(width: 20,),
                                Text("Notifications", style: TextStyle(fontSize: 25, color: Color(0xFF25344D)),),
                                Spacer(),
                                Image.asset("assets/images/right_icon.png"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),// Notifications
                      Container(
                        child: Container(
                          child: InkWell(
                            onTap: (){
                              print("Cliccato");
                            },
                            child: Row(
                              children: [
                                Image.asset("assets/images/log_out_icon.png"), // immagine
                                SizedBox(width: 20,),
                                Text("Sing Out", style: TextStyle(fontSize: 25, color: Color(0xFF25344D)),),
                                Spacer(),
                                Image.asset("assets/images/right_icon.png"),
                              ],
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
        SizedBox(height: 50,),// Account
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 20,right: 0, bottom: 5),
                child: Text("General", style:
                TextStyle(
                  color: Color(0xFF59729D),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 5, right: 25,bottom: 10),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        child: InkWell( // mi permette di eseguire diverse azioni su un widget con un animazione visibile all'utente
                          onTap: (){
                            print("Cliccato");
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.display_settings), // immagine
                                SizedBox(width: 20,),
                                Text("Display", style: TextStyle(fontSize: 25, color: Color(0xFF25344D)),),
                                Spacer(),
                                Image.asset('assets/images/right_icon.png'),
                              ],
                            ),
                          ),
                        ),
                      ), // Display
                      SizedBox(height: 10,),
                      Container(
                        child: Container(
                          child: InkWell(
                            onTap: (){
                              print("Cliccato");
                            },
                            child: Row(
                              children: [
                                Image.asset("assets/images/language_icon.png"), // immagine
                                SizedBox(width: 20,),
                                Text("App Language", style: TextStyle(fontSize: 25, color: Color(0xFF25344D)),),
                                Spacer(),
                                Image.asset("assets/images/right_icon.png"),
                              ],
                            ),
                          ),
                        ),
                      ), // App Language
                      SizedBox(height: 10,),
                      Container(
                        child: Container(
                          child: InkWell(
                            onTap: (){
                              print("Cliccato");
                            },
                            child: Row(
                              children: [
                                Image.asset("assets/images/lock_icon.png"), // immagine
                                SizedBox(width: 20,),
                                Text("Security", style: TextStyle(fontSize: 25, color: Color(0xFF25344D)),),
                                Spacer(),
                                Image.asset("assets/images/right_icon.png"),
                              ],
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
    );
  }
}
