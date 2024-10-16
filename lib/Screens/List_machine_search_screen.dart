import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/Screens/Product_main_screen.dart';

class ListMachineSearchScreen extends StatefulWidget {
  final String text; // nome categoria passata dalla pagina di ricerca
  const ListMachineSearchScreen({super.key, required this.text});

  @override
  State<ListMachineSearchScreen> createState() => _ListMachineSearchScreenState();
}

class _ListMachineSearchScreenState extends State<ListMachineSearchScreen> {


  int? selectedMachineIndex; // Variabile per l'indice del checkbox selezionato

  // lista di maccine della categoria temperaggio


  final Map<String, List<String>> categoryItems = {
    'TEMPERAGGIO': [
      'Selmi One Temperatrice Cioccolato',
      'Legend Temperatrice Cioccolato',
      'Color ex Temperatrice Cioccolato',
      'Plus Ex Temperatrice Cioccolato',
      'Futura Ex Temperatrice Cioccolato',
      'Top Ex Temperatrice Cioccolato',
      'Cento Temperatrice Cioccolato',
    ],
    'RICOPERTURA PRODOTTI CON IL CIOCCOLATO': [
      'R200 Legend',
      'RS200',
      'Truffle',
      'Automatic Truffle',
      'R400t Plus',
      'R600t',
    ],
    'MODELLAGGIO CIOCCOLATO': [
      'Mould Loader 175',
      'Moulding Line 275',
      'Smodellatore Automatico',
      'Injection Plate',
      'Filler Praline',
      'Filler Vasi',
      'Galileo',
    ],
    'TUNNEL di RAFFREDDAMENTO e RICOPERTURA': [
      'Spider',
      'Spider Max',
      'Smodellatore Automatico',
      'Tunnel 200/250mm',
      'Tunnel 300/400mm',
      'Tunnel 600mm',
      'Drops System',
    ],
    'ONE SHOT TUTTUNO': [
      'One Shot Tuttuno 4',
      'One Shot Tuttuno 9',
      'Charger 175/275',
      'Vibra',
      'Depositor',
      'Spinner Exit 175/275',
    ],
    'CLUSTER': [
      'Cluster',
      'Cluster Teglia',
    ],
    'CONFETTATRICI BASSINE': [
      'Comfit',
      'Comfit Maxi',
      'Spaysystem',
    ],
    'SCIOGLITORI e MISCELATORI': [
      'Tank 200',
      'Tank 400',
    ],
    'ESTRUSORI': [
      'Chocoform',
      'Chiocoliner',
      'Extrudeer',
    ],
    'RAFFINATRICI A SFERE': [
      'Micron 25',
      'Micron 50',
    ],
    'TOSTATRICI': [
      'Tostatrice Roaster 106',
      'Tostatrice Roaster 120',
    ],
    'BEAN TO BAR': [
      'Winnower',
      'Grinder Plus',
      'Conca 100',
      'Conca 200-400',
      'Vaglio',
    ],
    'LAVORAZIONE FRUTTA SECCA': [
      'Grinder Plus',
      'Grain',
      'Vaglio',
    ],
    'FONTANE DI CIOCCOLATO' :[
      'Macchia',
      'Macchia Temperante',
      'Fontana a muro'
    ]
  };

  @override
  Widget build(BuildContext context) {
    // Recupera gli elementi della categoria selezionata
    List<String> items = categoryItems[widget.text] ?? [];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: variant),
        backgroundColor: primary,
        title: Text("Machine", style: TextStyle(color: variant)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMachineIndex = index;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductMainScreen(
                                  nome: items[index],
                                  immagine: "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/selmi-one-temperatrice-cioccolato/selmi-one-temperatrice-cioccolato.png"
                              ),
                        ),
                      );
                    });
                  },
                  child: Container(
                    color: selectedMachineIndex == index ? primary : Colors
                        .transparent,
                    child: ListTile(
                      title: Text(
                        items[index],
                        style: TextStyle(
                          color: selectedMachineIndex == index
                              ? variant
                              : primary,
                          fontWeight: selectedMachineIndex == index ? FontWeight
                              .bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
