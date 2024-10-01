import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:prove/Navigation_component/Navigation.dart';
import 'package:prove/Screens/Qr_scan_main_screen.dart';
import 'package:prove/Screens/Saved_main_screen.dart';
import 'package:prove/Screens/Search_main_screen.dart';
import 'package:prove/Screens/Home_Screen.dart';
import 'package:prove/Screens/Settings_main_screen.dart';


class SearchMainScreen extends StatefulWidget {
  @override
  _SearchMainScreen createState() => _SearchMainScreen();
}

class _SearchMainScreen extends State<SearchMainScreen> {

  final TextEditingController _search = TextEditingController();

  int _selectedIndex = 1;

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
    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(child:
                      TextField(
                        decoration: InputDecoration(
                        hintText: 'Search...',
                      ),
                        controller: _search,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                    )),
                    Icon(Icons.search),
                    Icon(Icons.qr_code_scanner),
                  ],
                ),
              ),
            ), // search bar
            Container(), // lista
          ],
        ),
    );
  }
}
