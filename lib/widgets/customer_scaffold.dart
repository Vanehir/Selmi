import 'package:flutter/material.dart';
import 'package:prove/Screens/Document_main_screen.dart';
import 'package:prove/Screens/Product_main_screen.dart';
import 'package:prove/Screens/Home_Screen.dart';
import 'package:prove/Screens/Saved_main_screen.dart';
import 'package:prove/Screens/Search_main_screen.dart';
import 'package:prove/model/Richiesta_Model.dart';
import 'package:prove/Screens/Settings_main_screen.dart';


class CustomScaffold extends StatefulWidget {
  final List<Widget> pages;

  CustomScaffold({required this.pages});

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();


}

class _CustomScaffoldState extends State<CustomScaffold> {

  int _currentIndex = 0;

  void _doc() {
    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DocumentMainScreen()));
    });
  }

  // Lista delle pagine che verranno mostrate nel body
  final List<Widget> _pages = [
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
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ProductMainScreen()));
                            },
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
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => DocumentMainScreen()));
                            },
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
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    ),// home page
    Center(child: SearchMainScreen()),
    Center(child: Text('Qr Page')),
    Center(child: SavedMainScreen()),
    Center(child: SettingsMainScreen()),
  ];

  void _ontap(index){
    setState(() {
      _currentIndex = index; // Aggiorna l'indice selezionato
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: _pages[_currentIndex],
      backgroundColor: Color(0xFFF8F9FA),// Il body cambia dinamicamente in base all'indice
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF25344D), // Necessario per più di 3 icone
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner,),
            label: 'Qr Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_rounded,),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,),
            label: 'Settings',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFF59729D),
        unselectedItemColor: Color(0xFFF8F9FA),
        onTap: _ontap,
      ),
    );
  }
}
