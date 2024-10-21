import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prove/Buttons/Buttons.dart';

class DocumentMainScreens extends StatelessWidget {
  final String nome;
  const DocumentMainScreens({required this.nome, super.key});

  @override
  Widget build(BuildContext context) {
    return const DocumentMainScreen();
  }
}

class DocumentMainScreen extends StatefulWidget {
  const DocumentMainScreen({super.key});

  @override
  State<DocumentMainScreen> createState() => _DocumentMainScreenState();
}

class _DocumentMainScreenState extends State<DocumentMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: background),
        title: Text(
          "Documento",
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
            color: background,
          ),
        ),
        backgroundColor: primario,
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    Center(
                        child: Image.asset(
                      "assets/images/pdf_icon.png",
                      scale: 0.2,
                      height: 180,
                    )),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(Icons.star),
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      left: 20,
                      width: 25,
                      height: 25,
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset("assets/images/eye_on_icon.png"),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset("assets/images/language_icon.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 8, right: 20, bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Description",
                                  style: GoogleFonts.dosis(
                                    fontSize: 25,
                                    color: primario,
                                  ),
                                ),
                                const Divider(
                                  color: textfaded,
                                  height: 30,
                                  thickness: 2,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 25),
                                  child: Text(
                                    "La temperatrice modello CENTO si allinea alle versioni TOP EX e FUTURA EX conservandone le caratteristiche innovative delle stesse ma potenziando notevolmente la quantità produttiva grazie alla vasca da 100 kg che consentirà la ricopertura in tunnel di larghezza fino a 600 mm.",
                                    style: GoogleFonts.dosis(
                                      fontSize: 15,
                                      color: primario,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(23, 8, 0, 20),
                                    child: Text(
                                      "20/04/2010",
                                      style: GoogleFonts.dosis(
                                        fontSize: 13,
                                        color: primario,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(260, 8, 0, 0),
                                    child: Text(
                                      "pdf",
                                      style: GoogleFonts.dosis(
                                        fontSize: 13,
                                        color: primario,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: DownloadButton(
                                      text: "Download",
                                      onPressed: () {
                                        print("Download Button pressed!");
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        print("Another button pressed!");
                                      },
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: secondario,
                                        foregroundColor: background,
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize
                                            .min, // Mantiene la dimensione minima per il bottone
                                        children: [
                                          Icon(Icons.error,
                                              size:
                                                  20), // Inserisci qui l'icona che preferisci
                                          SizedBox(
                                              width:
                                                  8), // Spaziatura tra l'icona e il testo
                                          Text("report error"),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
