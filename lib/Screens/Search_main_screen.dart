import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/Screens/Qr_scan_main_screen.dart';


class SearchMainScreen extends StatefulWidget {
  @override
  _SearchMainScreen createState() => _SearchMainScreen();
}

class _SearchMainScreen extends State<SearchMainScreen> {

  final TextEditingController _search = TextEditingController();

  int? selectedTextIndex; // Variabile per l'indice del checkbox selezionato
  final List<String> options = [
    'TEMPERAGGIO',
    'RICOPERTURA PRODOTTI CON IL CIOCCOLATO',
    'MODELLAGGIO CIOCCOLATO',
    'CHOCAPAINT',
    'TUNNEL di RAFFREDDAMENTO e RICOPERTURA',
    'ONE SHOT TUTTUNO',
    'TUTTUNO ONE SHOTICE',
    'CLUSTER',
    'CONFETTATRICI BASSINE',
    'SCIOGLITORI e MISCELATORI',
    'ESTRUSORI',
    'RAFFINATRICI A SFERE',
    'TOSTATRICI',
    'BEAN TO BAR',
    'LAVORAZIONE FRUTTA SECCA',
    'FONTANE DI CIOCCOLATO'
  ]; // Lista di descrizioni per ciascun checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 1.0, left: 8.0, right: 8.0, bottom: 1.0), // Riduce lo spazio sui lati
          child: SafeArea(
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: ShapeDecoration(shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: primary),
                        borderRadius: BorderRadius.circular(40)
                    )),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...", // Placeholder del campo di ricerca
                        border: InputBorder.none, // Nessun bordo predefinito
                        contentPadding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 20),  // Padding verticale
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min, // Minimizza la larghezza della Row
                          children: <Widget>[
                            SizedBox(width: 5,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.search,color: primary)),
                            IconButton(onPressed: (){
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => QrScanMainScreen()),
                                );
                              });
                            }, icon: Icon(Icons.qr_code_scanner,color: primary)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ), // Search bar // search bar
                Expanded(
                  child: ListView.builder(
                    itemCount: options.length, // Numero di checkbox basato sulla lunghezza della lista
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedTextIndex = index;
                          });
                        },
                        child: Container(
                          color: selectedTextIndex == index ? primary : Colors.transparent, // Cambia colore di sfondo
                          child: ListTile(
                            title: Text(options[index], style: TextStyle(
                              color: selectedTextIndex == index ? variant : primary,
                              fontWeight: selectedTextIndex == index ? FontWeight.bold : FontWeight.normal, // Cambia spessore se selezionato
                            ),), // Testo diverso per ciascun checkbox

                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
