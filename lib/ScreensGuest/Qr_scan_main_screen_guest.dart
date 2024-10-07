import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class QrScanMainScreenGuest extends StatefulWidget {
  const QrScanMainScreenGuest({super.key});

  @override
  State<QrScanMainScreenGuest> createState() => _QrScanMainScreenGuestState();
}

class _QrScanMainScreenGuestState extends State<QrScanMainScreenGuest> {

  String scannedResult = "Nessun risultato";


  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan(); // Esegue la scansione
      setState(() {
        scannedResult = result.rawContent.isEmpty ? "Nessun codice QR trovato" : result.rawContent; // Mostra il risultato della scansione
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

      appBar: AppBar(
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: scanBarcode,
                child: Text('Scansiona QR Code'),
              ),
              Text(
                scannedResult,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: ShapeDecoration(shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: darklue),
                      borderRadius: BorderRadius.circular(20)
                  )),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Insert code", // Placeholder del campo di ricerca
                      border: InputBorder.none, // Nessun bordo predefinito
                      contentPadding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 20),  // Padding verticale
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min, // Minimizza la larghezza della Row
                        children: <Widget>[
                          SizedBox(width: 5,),
                          IconButton(onPressed: (){
                            setState(() {
                              scannedResult = " "; // Mostra il risultato della scansione
                            });
                          }, icon: Icon(Icons.backspace_outlined,color: darklue)),
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
