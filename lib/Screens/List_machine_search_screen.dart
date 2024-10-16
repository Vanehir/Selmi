import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/Screens/Product_main_screen.dart';

class ListMachineSearchScreen extends StatefulWidget {
  const ListMachineSearchScreen({super.key, required text});

  @override
  State<ListMachineSearchScreen> createState() => _ListMachineSearchScreenState();
}

class _ListMachineSearchScreenState extends State<ListMachineSearchScreen> {


  int? selectedMachineIndex; // Variabile per l'indice del checkbox selezionato

  // lista di maccine della categoria temperaggio
  final List<String> temperaggio = [
    'Selmi One Temperatrice Cioccolato',
    'Legend Temperatrice Cioccolato',
    'Color ex Temperatrice Cioccolato',
    'Plus Ex Temperatrice Cioccolato',
    'Futura Ex Temperatrcice cioccoato',
    'Top Ex Temepratrice Cioccolato',
    'Cento Temperatrice Cioccolato',
  ];

  final List<String> ricopertura = [
    'R200 Legend',
    'RS200',
    'Truffle',
    'Automatic truffle',
    'R400t Plus',
    'R600t'
  ];

  final List<String> modellaggio = [
    'Mould Loader 175',
    'Moulding Line 275',
    'Smodellatore Automatico',
    'Injection Plate',
    'Filler Praline',
    'Filler vasi',
    'galileo'
  ];

  final List<String> raffreddamento = [
    'spider',
    'spider max',
    'Smodellatore Automatico',
    'Tunnel 200/250mm',
    'Tunnel 300/400mm',
    'Tunnel 600mm',
    'Drops System'
  ];

  final List<String> tuttunoOne = [
    'One shot Tuttuno 4',
    'One shot Tuttuno 9',
    'Charger 175/275',
    'vibra',
    'depositor',
    'Spinner exit 175/275',
  ];

  final List<String> cluster = [
    'Cluster',
    'Cluster Teglia',
  ];

  final List<String> confettatrici = [
    'comfit',
    'comfit Maxi',
    'Spaysystem',
  ];

  final List<String> scoglitori = [
    'Tank 200',
    'Tank 400',
  ];

  final List<String> estrusori = [
    'Chocoform',
    'Chiocoliner',
    'Extrudeer'
  ];

  final List<String> raffinatrici = [
    'micron 25',
    'micron50',
  ];

  final List<String> testatrici = [
    'Tostatrice Roaster 106',
    'Tostatrice Roaster 120',
  ];

  final List<String> bar = [
    'winnower',
    'Grinder Plus',
    'Conca 100',
    'Conca 200-400',
    'Vaglio'
  ];

  final List<String> frutta = [
    'Grinder Plus',
    'Grain',
    'Vaglio'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: variant
        ),
        backgroundColor: primary,
        title: Text("Machine", style: TextStyle(color: variant),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: temperaggio.length, // Numero di checkbox basato sulla lunghezza della lista
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedMachineIndex = index;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductMainScreen(nome: temperaggio[index], immagine: "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/selmi-one-temperatrice-cioccolato/selmi-one-temperatrice-cioccolato.png")),
                      );
                    });
                  },
                  child: Container(
                    color: selectedMachineIndex == index ? primary : Colors.transparent, // Cambia colore di sfondo
                    child: ListTile(
                      title: Text(temperaggio[index], style: TextStyle(
                        color: selectedMachineIndex == index ? variant : primary,
                        fontWeight: selectedMachineIndex == index ? FontWeight.bold : FontWeight.normal, // Cambia spessore se selezionato
                      ),), // Testo diverso per ciascun checkbox

                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ), // lista categorie
    );
  }
}
