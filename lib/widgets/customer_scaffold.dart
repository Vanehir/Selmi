import 'package:flutter/material.dart';
import 'package:prove/Screens/Document_main_screen.dart';
import 'package:prove/Screens/Product_main_screen.dart';
import 'package:prove/Screens/Home_Screen.dart';
import 'package:prove/Screens/Qr_scan_main_screen.dart';
import 'package:prove/Screens/Saved_main_screen.dart';
import 'package:prove/Screens/Search_main_screen.dart';
import 'package:prove/ScreensAdmin/Product_main_screen_admin.dart';
import 'package:prove/ScreensAdmin/Search_main_screen_admin.dart';
import 'package:prove/model/Richiesta_Model.dart';
import 'package:prove/Screens/Settings_main_screen.dart';
import 'package:prove/Colors/color_palette.dart';

class CustomScaffold extends StatefulWidget {
  final List<Widget> pages;
  final String accesso;


  const CustomScaffold({required this.pages, Key? key, required this.accesso}) : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  int _currentIndex = 0;

  void _navigateToDocumentScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DocumentMainScreen()),
    );
  }

  void _onTapBottomNav(int index) {
    setState(() => _currentIndex = index);
  }

  Widget control (){
    if(widget.accesso == 'admin'){
       return SearchMainScreenAdmin();
    }
    else{
       return SearchMainScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
        _buildHomePage(),
        //SearchMainScreen(),
        control(),
        QrScanMainScreen(),
        SavedMainScreen(),
        SettingsMainScreen(accesso: widget.accesso,),
    ];

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: _pages[_currentIndex],
      backgroundColor: neutral,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Qr Scan'),
          BottomNavigationBarItem(icon: Icon(Icons.save_rounded), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: secondary,
        unselectedItemColor: primary,
        onTap: _onTapBottomNav,
      ),
    );
  }

  Widget _buildHomePage() {
    return Column(
      children: [
        SizedBox(height: 40,),
        Image.asset('assets/images/selmi_logo.png', height: 38),
        const SizedBox(height: 10),
        _buildSectionTitle(context, "LAST SCANNED MACHINES"),
        Expanded(child: _buildMachineList()),
        const SizedBox(height: 10),
        _buildSectionTitle(context, "LAST VIEWED DOCUMENTS"),
        Expanded(child: _buildDocumentList()),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 2))),
      child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
    );
  }

  Widget _buildMachineList() {
    return FutureBuilder<List<dynamic>>(
      future: fetchTemperaggioData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: error)));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data found', style: TextStyle(color: error)));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return _buildMachineListItem(snapshot.data![index]);
            },
          );
        }
      },
    );
  }

  Widget _buildMachineListItem(dynamic item) {
    return ListTile(
      title: InkWell(
        onTap: () {
          if(widget.accesso == 'user'){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductMainScreen(
                  nome: item['nome'],
                  immagine: item['Image'],
                ),
              ),
            );
          }
          else{
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductMainScreenAdmin(
                  nome: item['nome'],
                  immagine: item['Image'],
                ),
              ),
            );
          }
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(item['Image'], height: 80, width: 50, fit: BoxFit.cover),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['nome'], style: TextStyle(fontSize: 18, color: secondary)),
                Row(
                  children: [
                    Text(item['category'], style: TextStyle(color: secondary)),
                    const SizedBox(width: 20),
                    Text(item['year'], style: TextStyle(color: secondary)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentList() {
    return FutureBuilder<List<dynamic>>(
      future: fetchDocumentiData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: error)));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data found', style: TextStyle(color: error)));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return _buildDocumentListItem(snapshot.data![index]);
            },
          );
        }
      },
    );
  }

  Widget _buildDocumentListItem(dynamic item) {
    return ListTile(
      title: InkWell(
        onTap: _navigateToDocumentScreen,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/pdf_icon.png'),
            ),
            Expanded( // Utilizza Expanded per allineare a sinistra
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'], style: Theme.of(context).textTheme.bodyLarge),
                  Row(
                    children: [
                      Text(item['data'], style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(width: 20),
                      Text(item['tipo'], style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }

}
