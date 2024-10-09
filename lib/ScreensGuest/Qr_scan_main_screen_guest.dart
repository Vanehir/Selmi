import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

import '../Screens/Product_main_screen.dart';

class QrScanMainScreenGuest extends StatefulWidget {
  const QrScanMainScreenGuest({super.key});

  @override
  State<QrScanMainScreenGuest> createState() => _QrScanMainScreenGuestState();
}

class _QrScanMainScreenGuestState extends State<QrScanMainScreenGuest> {

  String scannedResult = "Nessun risultato";
  final TextEditingController _seialInput = TextEditingController();

  void SerialCode(){

    if(_seialInput == "Selmi One Temperatrice Cioccolato"){


      setState(() {  // ogni volta che viene scansionato un qr, il testo viene portato nella pagina nuova
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProductMainScreen(nome: _seialInput.text, immagine: "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/selmi-one-temperatrice-cioccolato/selmi-one-temperatrice-cioccolato.png",)));
      });

    }
  }

  Future<void> scanBarcode() async {
    var immagine = "";
    try {
      var result = await BarcodeScanner.scan();
      var risultato = result.rawContent; // Esegue la scansione

      if(risultato == "Selmi One Temperatrice Cioccolato"){
        immagine = "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/selmi-one-temperatrice-cioccolato/selmi-one-temperatrice-cioccolato.png";
      }
      else if(risultato == "Legend Temperatrice Cioccolato"){
        immagine = "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/legend-temperatrice-cioccolato/legend-temperatrice-cioccolato.png";
      }
      else if(risultato == "Color EX Temperatrice Cioccolato"){
        immagine = "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/color-ex-temperatrice-cioccolato/color-ex-temperatrice-cioccolato.png";
      }
      else if(risultato == "Plus EX Temperatrice Cioccolato"){
        immagine = "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/plus-ex-temperatrice-cioccolato/plus-ex-temperatrice-cioccolato.png";
      }
      else if(risultato == "Plus EX Temperatrice Cioccolato"){
        immagine = "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/plus-ex-temperatrice-cioccolato/plus-ex-temperatrice-cioccolato.png";
      }
      else if(risultato == "Top Ex Temperatrice Cioccolato"){
        immagine = "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/top-ex-temperatrice-cioccolato/top-ex-temperatrice-cioccolato.png";
      }
      else if(risultato == "Cento Temperatrice Cioccolato"){
        immagine = "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/cento-temperatrice-cioccolato/cento-temperatrice-cioccolato.png";
      }

      setState(() {  // ogni volta che viene scansionato un qr, il testo viene portato nella pagina nuova
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProductMainScreen(nome: result.rawContent, immagine: immagine,)));
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
                    controller: _seialInput,
                    decoration: InputDecoration(
                      hintText: "Insert code", // Placeholder del campo di ricerca
                      border: InputBorder.none, // Nessun bordo predefinito
                      contentPadding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 20),  // Padding verticale
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min, // Minimizza la larghezza della Row
                        children: <Widget>[
                          SizedBox(width: 5,),
                          IconButton(onPressed: (){
                            //SerialCode();
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
