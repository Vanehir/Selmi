import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart'; // Importa la palette dei colori personalizzati
import 'package:prove/Screens/Document_main_screen.dart'; // Importa la schermata per visualizzare i documenti
import 'package:prove/model/Object_class.dart'; // Importa la classe modello per gli oggetti
import 'package:provider/provider.dart'; // Importa il pacchetto provider per la gestione dello stato

// Definisce un widget Stateful chiamato ProductMainScreen
class ProductMainScreen extends StatefulWidget {
  final String nome; // Nome del prodotto
  final String immagine; // URL dell'immagine del prodotto

  // Costruttore per inizializzare il widget con il nome e l'immagine
  const ProductMainScreen({required this.nome, required this.immagine, super.key});

  @override
  State<ProductMainScreen> createState() => _ProductMainScreenState(); // Restituisce lo stato associato a questo widget
}

// Classe di stato per ProductMainScreen
class _ProductMainScreenState extends State<ProductMainScreen> {
  bool isStar = false; // Stato per controllare se l'elemento è nei preferiti

  // Metodo per navigare alla schermata DocumentMainScreen
  void navigateToDocumentScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DocumentMainScreen()), // Naviga a DocumentMainScreen
    );
  }

  @override
  void initState() {
    super.initState();
    final itemProvider = Provider.of<ItemProvider>(context, listen: false); // Ottiene l'itemProvider
    // Controlla se l'elemento è già nei preferiti
    isStar = itemProvider.itemList.any((item) => item.titolo == widget.nome); // Imposta isStar in base alla presenza del prodotto nei preferiti
  }

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context, listen: false); // Ottiene l'itemProvider

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: neutral, // Imposta il colore dell'icona dell'AppBar
        ),
        title: Text(
          widget.nome, // Mostra il nome del prodotto come titolo dell'AppBar
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: neutral), // Stile del titolo
        ),
        backgroundColor: primary, // Imposta il colore di sfondo dell'AppBar
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity, // Imposta la larghezza del contenitore al massimo
            child: Stack(
              children: [
                Center(child: Image.network(widget.immagine, height: 300)), // Mostra l'immagine del prodotto
                Positioned(
                  top: 20,
                  right: 20,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isStar = !isStar; // Inverte lo stato di isStar al click
                        if (isStar) {
                          itemProvider.toggleItem(widget.nome, widget.immagine); // Aggiunge il prodotto ai preferiti
                        } else {
                          itemProvider.removeItem(widget.nome); // Rimuove il prodotto dai preferiti
                        }
                      });
                    },
                    child: Icon(isStar ? Icons.star : Icons.star_border), // Mostra l'icona della stella
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: InkWell(
                    onTap: () {
                      // Aggiungi qui l'azione per l'icona QR
                    },
                    child: Icon(Icons.qr_code_scanner), // Icona per la scansione QR
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: InkWell(
                    onTap: () {
                      // Aggiungi qui l'azione per l'icona lingua
                    },
                    child: Image.asset("assets/images/language_icon.png"), // Icona per selezionare la lingua
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50), // Spaziatura verticale
                _buildSection(
                  title: "Specs", // Sezione per le specifiche
                  onTap: navigateToDocumentScreen, // Naviga alla schermata DocumentMainScreen al click
                ),
                SizedBox(height: 30), // Spaziatura verticale
                _buildSection(
                  title: "Manual", // Sezione per il manuale
                  onTap: navigateToDocumentScreen,
                ),
                SizedBox(height: 30), // Spaziatura verticale
                _buildSection(
                  title: "Other", // Sezione per altre informazioni
                  onTap: navigateToDocumentScreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Metodo per costruire una sezione del contenuto
  Widget _buildSection({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8), // Padding per la sezione
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 25, color: primary)), // Mostra il titolo della sezione
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset("assets/images/pdf_icon.png"), // Icona per il documento PDF
                  InkWell(
                    onTap: onTap, // Azione al click
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nome Documento", // Nome del documento
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: secondary), // Stile del testo
                          ),
                          Row(
                            children: [
                              SizedBox(width: 50),
                              Text("Data Upload", style: TextStyle(color: secondary)), // Data di caricamento
                              SizedBox(width: 100),
                              Text("Type", style: TextStyle(color: secondary)), // Tipo di documento
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
