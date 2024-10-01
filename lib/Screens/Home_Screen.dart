import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:prove/Navigation_component/Navigation.dart';

import 'package:prove/model/Richiesta_Model.dart';
import 'package:prove/Screens/Qr_scan_main_screen.dart';
import 'package:prove/Screens/Saved_main_screen.dart';
import 'package:prove/Screens/Search_main_screen.dart';
import 'package:prove/Screens/Settings_main_screen.dart';
import 'package:prove/widgets/customer_scaffold.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  int _selectedIndex = 0;

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomScaffold(
        pages: [
          Column(
            children: <Widget>[
              Image.network(
                'https://www.selmi-group.it/img/sede-selmi.jpg', // replace with actual image URL
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2)
                    )
                ),
                child: Text("Last scanned machine", style: TextStyle(color: Color(0xFF25344D), fontSize: 25),),
              ), // last scan
              SizedBox(height: 0),
              // Fetch and display the list from JSON
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchTemperaggioData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Color(0xFFC44536)),));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No data found',style: TextStyle(color: Color(0xFFC44536))));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data![index];
                          return Container(
                            width: double.infinity,
                            child: ListTile(
                              title: Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(item['image'], height: 80, width: 50, fit: BoxFit.cover,),
                                    ),
                                    Column(
                                      children: [
                                        Text(item['name'], style: TextStyle(fontSize: 18, color: Color(0xFF59729D)),),
                                        Row(
                                          children: [
                                            Text(item['category'], style: TextStyle(color: Color(0xFF59729D)),maxLines: 1, overflow: TextOverflow.ellipsis),
                                            SizedBox(width: 20,),
                                            Text(item['year'], style: TextStyle(color: Color(0xFF59729D)),),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 80,)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2)
                    )
                ),
                child: Text("Last documents opened", style: TextStyle(color: Color(0xFF25344D), fontSize: 25),),
              ), // last opened
              SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchDocumentiData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Color(0xFFC44536)),));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No data found',style: TextStyle(color: Color(0xFFC44536))));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data![index];
                          return Container(
                            /* decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 2)
                          )
                      ),

                      */ // border bottom
                            width: double.infinity,
                            child: ListTile(
                              title: Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/images/pdf_icon.png'),
                                    ),
                                    Column(
                                      children: [
                                        Text(item['name'], style: TextStyle(fontSize: 18, color: Color(0xFF59729D)),),
                                        Row(
                                          children: [
                                            Text(item['data'], style: TextStyle(color: Color(0xFF59729D)),maxLines: 1, overflow: TextOverflow.ellipsis),
                                            SizedBox(width: 20,),
                                            Text(item['tipo'], style: TextStyle(color: Color(0xFF59729D)),),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 80,)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Center(child: Text('Search Page')),
          Center(child: Text('Qr Page')),
          Center(child: Text('Saved Page')),
          Center(child: Text('Settings Page')),
        ],
      ),
    );
  }
}
