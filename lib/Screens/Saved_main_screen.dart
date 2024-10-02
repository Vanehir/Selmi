import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:prove/Navigation_component/Navigation.dart';
import 'package:prove/Screens/Qr_scan_main_screen.dart';
import 'package:prove/Screens/Saved_main_screen.dart';
import 'package:prove/Screens/Search_main_screen.dart';
import 'package:prove/Screens/Home_Screen.dart';
import 'package:prove/Screens/Settings_main_screen.dart';


class SavedMainScreen extends StatefulWidget {
  @override
  _SavedMainScreen createState() => _SavedMainScreen();
}

class _SavedMainScreen extends State<SavedMainScreen> {

  int _selectedIndex = 3;

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
        SizedBox(height: 100,),
        Center(
          child: Text("Saved", style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
        ),
        SizedBox(height: 40,),
        Container(
          width: double.infinity,
          height: 600,
          decoration: ShapeDecoration(shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2
            )
          )),
          child: Column(
            children: [

            ],
          ),
        ),
      ],
    );
  }
}
