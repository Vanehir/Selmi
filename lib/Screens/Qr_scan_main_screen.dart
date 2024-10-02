import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:http/http.dart' as http;


class QrScanMainScreen extends StatefulWidget {
  @override
  _QrScanMainScreen createState() => _QrScanMainScreen();
}

class _QrScanMainScreen extends State<QrScanMainScreen> {


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

      appBar: AppBar(),
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
                      side: BorderSide(width: 2, color: Color(0xFF25344D)),
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
                            }, icon: Icon(Icons.backspace_outlined,color: Color(0xFF25344D))),
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
