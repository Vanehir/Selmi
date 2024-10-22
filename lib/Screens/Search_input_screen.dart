import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/Screens/Home_Screen.dart';
import 'package:prove/Screens/Qr_scan_main_screen.dart';
import 'package:prove/Screens/List_machine_search_screen.dart';
import 'package:prove/Screens/Search_main_screen.dart';

class SearchInputScreen extends StatefulWidget {
  const SearchInputScreen({super.key});

  @override
  State<SearchInputScreen> createState() => _SearchInputScreenState();
}

class _SearchInputScreenState extends State<SearchInputScreen> {

  final TextEditingController _search = TextEditingController();
  bool isSearching = false; // Variabile per sapere se si sta cercando
  bool isFlipped = false;
  bool isPanelVisible = false; // Variabile per controllare la visibilità del pannello
  int? selectedTextIndex;
  final List<String> options = [
    'TEMPERAGGIO', 'RICOPERTURA PRODOTTI CON IL CIOCCOLATO', 'MODELLAGGIO CIOCCOLATO',
    'CHOCAPAINT', 'TUNNEL di RAFFREDDAMENTO e RICOPERTURA', 'ONE SHOT TUTTUNO',
    'CLUSTER', 'CONFETTATRICI BASSINE', 'SCIOGLITORI e MISCELATORI', 'ESTRUSORI',
    'RAFFINATRICI A SFERE', 'TOSTATRICI', 'BEAN TO BAR', 'LAVORAZIONE FRUTTA SECCA',
    'FONTANE DI CIOCCOLATO'
  ];
  bool isAscending = true;
  double sheetPosition = 0.4; // Posizione iniziale del foglio

  @override
  void initState() {
    super.initState();
    _search.addListener(() {
      setState(() {
        isSearching = _search.text.isNotEmpty;
      });
    });
  }

  void _flipIcon() {
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  void order (){
    setState(() {
      if (isAscending) {
        options.sort((a, b) => a.compareTo(b));
      } else {
        options.sort((a, b) => b.compareTo(a));
      }
      isAscending = !isAscending;
    });
  }

  void _togglePanel() {
    setState(() {
      isPanelVisible = !isPanelVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: neutral,
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                controller: _search,
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 20),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(width: 5,),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: primary)),
                      IconButton(onPressed: (){
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const QrScanMainScreen()),
                          );
                        });
                      }, icon: const Icon(Icons.qr_code_scanner,color: primary)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0, bottom: 1.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTextIndex = index;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListMachineSearchScreen(category: options[index])),
                            );
                          });
                        },
                        child: Container(
                          color: selectedTextIndex == index ? primary : Colors.transparent,
                          child: ListTile(
                            title: Text(options[index], style: TextStyle(
                              color: selectedTextIndex == index ? variant : primary,
                              fontWeight: selectedTextIndex == index ? FontWeight.bold : FontWeight.normal,
                            ),),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 130, right: 130, bottom: 16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen(accesso: 'user')),
                      );
                    },
                    child: const Icon(Icons.arrow_back, color: neutral,),
                  ),
                  InkWell(
                    onTap: _togglePanel, // Mostra/Nascondi il pannello
                    child: const Icon(Icons.sort, color: neutral,),
                  ),
                  InkWell(
                    onTap: () {
                      order();
                      _flipIcon();
                    },
                    child: Transform(
                      transform: Matrix4.identity()..scale(1.0,isFlipped ? -1.0 : 1.0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.swap_vert, color: neutral,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isPanelVisible)
            DraggableScrollableSheet(
              initialChildSize: sheetPosition,
              minChildSize: 0.1,
              maxChildSize: 0.7,
              builder: (BuildContext context, ScrollController scrollController) {
                return NotificationListener<DraggableScrollableNotification>(
                  onNotification: (DraggableScrollableNotification notification) {
                    setState(() {
                      sheetPosition = notification.extent; // Traccia la posizione del foglio
                      if (sheetPosition <= 0.1) {
                        isPanelVisible = false; // Nascondi il pannello quando raggiunge la dimensione minima
                      }
                    });
                    return true;
                  },
                  child: Container(
                    color: primary,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            'Item $index',
                            style: TextStyle(color: neutral),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
