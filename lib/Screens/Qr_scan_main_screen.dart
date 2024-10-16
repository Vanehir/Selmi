import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/Screens/Product_main_screen.dart';

class QrScanMainScreen extends StatefulWidget {
  const QrScanMainScreen({super.key});

  @override
  _QrScanMainScreen createState() => _QrScanMainScreen();
}

class _QrScanMainScreen extends State<QrScanMainScreen> {
  String scannedResult = "Nessun risultato";

  /// i Qr hanno un testo che è il nome del prodotto, così il nome viene inviato al nuovo
  /// Widget e lo viene messo come titolo della scheda prototto

  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      var risultato = result.rawContent; // Esegue la scansione
      setState(() {
        // ogni volta che viene scansionato un qr, il testo viene portato nella pagina nuova
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductMainScreen(
                    nome: result.rawContent,
                    immagine:
                        "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/selmi-one-temperatrice-cioccolato/selmi-one-temperatrice-cioccolato.png")));
      });
    } catch (e) {
      setState(() {
        scannedResult = "Errore nella scansione: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: scanBarcode,
                child: const Text('Scansiona QR Code'),
              ),
              Text(
                scannedResult,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 2, color: primario),
                          borderRadius: BorderRadius.circular(20))),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:
                          "Insert code", // Placeholder del campo di ricerca
                      border: InputBorder.none, // Nessun bordo predefinito
                      contentPadding: const EdgeInsets.symmetric(vertical: 15)
                          .copyWith(left: 20), // Padding verticale
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize
                            .min, // Minimizza la larghezza della Row
                        children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  scanBarcode();
                                  scannedResult = " ";
                                });
                              },
                              icon: const Icon(Icons.backspace_outlined,
                                  color: primario)),
                        ],
                      ),
                    ),
                  ),
                ),
              ), // code manual
            ],
          ),
        ),
      ),
    );
  }
}
